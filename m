Received: from tidos.tid.es ([193.145.240.2] helo=tid.tid.es)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15eyRT-0004ed-00
	for <linux-mtd@lists.infradead.org>; Thu, 06 Sep 2001 13:39:36 +0100
Received: from tid.es ([1.0.22.18]) by tid.tid.es (Netscape
          Messaging Server 4.15) with ESMTP id GJ8RFC02.Z3M for
          <linux-mtd@lists.infradead.org>; Thu, 6 Sep 2001 14:45:12 +0200
Message-ID: <3B976F5A.2000209@tid.es>
Date: Thu, 06 Sep 2001 14:43:06 +0200
From: Jose =?ISO-8859-1?Q?Rodr=EDguez?= Argente <jradc@tid.es>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Trying to compile mtd-snapshot
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi,

   I am trying to compile in my PC the mtd-snapshot-20010806 package to 
get the jffs utilities working. I have executed:

   automake --foreign  (the automake version is 1.5)

and I get the following message:

/usr/local/share/automake/am/depend2.am: AMDEP does not appear in 
AM_CONDITIONAL
/usr/local/share/automake/am/depend2.am: AMDEP does not appear in 
AM_CONDITIONAL
/usr/local/share/automake/am/depend2.am: AMDEP does not appear in 
AM_CONDITIONAL
/usr/local/share/automake/am/lang-compile.am: AMDEP does not appear in 
AM_CONDITIONAL

Then I run autoconf and ./configure with no problem. But when finally I 
run make, the message is :

Makefile:340: *** missing separator.  Stop.

Line 340 in the Makefile is:

@AMDEP_TRUE@@am__include@ @am__quote@$(DEPDIR)/compr.Po@am__quote@

What am I doing wrong? Do I need another version of automake, or any patch?

Thanks a lot,

Pepe
