Received: from marasystems.com ([213.15.252.90] helo=filer.marasystems.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17vyOZ-00075v-00
	for <linux-mtd@lists.infradead.org>; Mon, 30 Sep 2002 12:07:23 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Henrik Nordstrom <hno@marasystems.com>
To: Schlager Kristian-KSCHLAG1 <Kristian.Schlager@motorola.com>,
   linux-mtd@lists.infradead.org
Subject: Re: JFFS(2) on Compact Flash
Date: Mon, 30 Sep 2002 13:07:13 +0200
References: <8D4D5329976AD311B47800508B5D521D0329D643@c3po.vienna.ecid.cig.mot.com>
In-Reply-To: <8D4D5329976AD311B47800508B5D521D0329D643@c3po.vienna.ecid.cig.mot.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200209301307.13462.hno@marasystems.com>
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

My recommendation: Have temporary files on a ramdisk and mount the CF with the 
"sync" option, and if possible keep it "ro" at most times..

Regards
Henrik

Schlager Kristian-KSCHLAG1 wrote:
> I am running Linux on a Jumptec Dimm PC with built-in Compact Flash.
> As powerfailures cannot be avoided, the ext2 fs gets screwed up after some
> time. Can I use JFFS on the Compact Flash?
> I have read Simon Evans' posting on his mtd/block driver (June 2001) and
> the follow ups. One poster was stating that it makes no sense to run JFFS
> on CF.
>
> Does ext3 (or do other journaling fs) indead perform as well as JFFS(2)
> regarding stability after power failures?
>
> Or is the only save way to put all temporay files on ramdisk and have the
> CF mount read-only?
>
>
> Kristian Schlager
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
