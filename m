Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13587I-0004zO-00
	for mtd-list@infradead.org; Thu, 22 Jun 2000 15:38:04 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13587H-0004zI-00
	for mtd@infradead.org; Thu, 22 Jun 2000 15:38:03 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <39522510.394D649C@techno.spb.ru> 
References: <39522510.394D649C@techno.spb.ru> 
To: maxs@techno.spb.ru
Cc: mtd@infradead.org
Subject: Re: Compilation errors on 2.2.14 kernel 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 22 Jun 2000 15:39:43 +0100
Message-ID: <14771.961684783@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


maxs@techno.spb.ru said:
>  Now I have 2.2.14 and got compilation errors. What wrong I do? How to
> prepare my system to compilation (what symlinks needed?)

You need to grab a copy of linux/include/linux/compatmac.h from a more 
recent kernel. Best bet is just to use 2.2.16 instead - why do you want to 
use a kernel which has known security flaws?

You'll also need to apply this (in reverse, sorry):

diff -ur linux/kernel/ksyms.c /inst/nora/nora-orig/linux/kernel/ksyms.c
--- linux/kernel/ksyms.c	Tue Jun 13 14:05:00 2000
+++ /inst/nora/nora-orig/linux/kernel/ksyms.c	Fri May 26 04:28:48 2000
@@ -79,7 +79,6 @@
 
 #ifdef CONFIG_MODULES
 EXPORT_SYMBOL(get_module_symbol);
-EXPORT_SYMBOL(put_module_symbol);
 #endif
 EXPORT_SYMBOL(get_options);
 
diff -ur linux/kernel/module.c /inst/nora/nora-orig/linux/kernel/module.c
--- linux/kernel/module.c	Tue Jun 13 14:16:26 2000
+++ /inst/nora/nora-orig/linux/kernel/module.c	Fri May 26 04:28:48 2000
@@ -946,9 +946,7 @@
  * Gets the address for a symbol in the given module.  If modname is
  * NULL, it looks for the name in any registered symbol table.  If the
  * modname is an empty string, it looks for the symbol in kernel exported
- * symbol tables. Increase the usage count of the module in which the
- * symbol was found - it's the only way we can guarantee that it's still
- * there by the time our caller actually uses it.
+ * symbol tables.
  */
 unsigned long
 get_module_symbol(char *modname, char *symname)
@@ -965,29 +963,12 @@
 				i > 0; --i, ++sym) {
 
 				if (strcmp(sym->name, symname) == 0) {
-					__MOD_INC_USE_COUNT(mp);
 					return sym->value;
 				}
 			}
 		}
 	}
 	return 0;
-}
-
-/* Decrease the use count of the module containing a symbol with the 
- * address passed.
- */
-void put_module_symbol(unsigned long addr)
-{
-	struct module *mp;
-
-	for (mp = module_list; mp; mp = mp->next) {
-		if (addr >= (unsigned long)mp &&
-		    addr < (unsigned long)mp + mp->size) {
-			__MOD_DEC_USE_COUNT(mp);
-			return;
-		}
-	}
 }
 
 #else		/* CONFIG_MODULES */


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
