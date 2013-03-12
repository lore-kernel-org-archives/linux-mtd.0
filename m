Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UFN33-0007TK-Uz
 for linux-mtd@lists.infradead.org; Tue, 12 Mar 2013 11:07:14 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/9] mtd: add 'const' qualifiers
Date: Tue, 12 Mar 2013 13:08:19 +0200
Message-Id: <1363086508-2405-1-git-send-email-dedekind1@gmail.com>
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Michael Buesch <m@bues.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch-set amends declarations of arrays of partition parser names, as well
as declarations of few MTD functions which deal with such arrays.

The arrays are typically defined as 'const char **probes' or 'const char
*probes[]'. The arrays basically "list" names of MTD partition parsers. To put
it differently, they are arrays of pointers which point to strings.

The 'const' there means that the strings constant. IOW, probes points to a
pointer which points to a constant character).

What we do in this series is we turn the declarations into
'const char * const * probes' or 'const char * const probes[]'. This means that
not only the strings are constant, but the pointers pointing to them are also
constant. IOW, probes points to a constant pointer which points to a constant
character.

The motivation for this work is to make the code a bit stricter, less error
prone, and potentially enable the compiler to do more optimizations.

Thanks,
Artem.
