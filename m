Received: from 12-234-34-139.client.attbi.com ([12.234.34.139] helo=heavens.murgatroid.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17hDa8-0006Xt-00
	for <linux-mtd@lists.infradead.org>; Tue, 20 Aug 2002 19:18:20 +0100
From: "Christopher Hoover" <ch@murgatroid.com>
To: "'Conn Clark'" <clark@esteem.com>,
	"'MTD Mailing List'" <linux-mtd@lists.infradead.org>
Subject: RE: Re: How does one mount an existing jffs2 partition so it is   writeable?
Date: Tue, 20 Aug 2002 11:18:56 -0700
Message-ID: <004001c24876$0c2ad670$7800000a@derelict>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <3D628428.312055B5@esteem.com>
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

At one point locking and unlocking flash with variable-sized blocks
(such as Intel C3 flash) simply didn't work.  I fixed it -- the correct
code is in CVS and in current 2.4 (after some release I cannot
remember), but the changes unfortunately aren't in 2.5.

Check drivers/mtd/chips/cfi_cmdset_0001.c in your sources.   You should
see a changelog entry from me dated 02/05/2002; if you don't see it, you
don't have the fix.

-ch
ch@murgatroid.com
ch@hpl.hp.com
