Received: from 235-216.205.122.dellhost.com ([216.205.122.235] helo=imagequestdesign.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Y5OK-0003gG-00
	for <linux-mtd@lists.infradead.org>; Fri, 26 Jul 2002 14:44:24 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Mark Meade <mark@lakeshoremicro.com>
To: Frank Oltmanns <frank.oltmanns.ml@gmx.de>
Subject: Re: Compiling Grub for DOC2000
Date: Fri, 26 Jul 2002 09:43:41 -0400
References: <23438.1027689702@www54.gmx.net>
In-Reply-To: <23438.1027689702@www54.gmx.net>
Cc: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200207260940781.SM02488@there>
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

Hi Frank,

I've seen these errors with the newest GRUB patch -- I think the latest patch 
may be against the CVS version of GRUB, rather than 0.92.

I've had good luck patching GRUB 0.92 with the 2002-05-30 patch at:
http://savannah.gnu.org/bugs/?func=detailbug&bug_id=505&group_id=68

Regards,

Mark

Frank Oltmanns wrote:
> I want the whole thing to boot without NFS from DOC. I want to use grub
> to get it work, but I can't even compile grub. This is what I did:
