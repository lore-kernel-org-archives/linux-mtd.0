Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wjqa2-0005gx-H8
 for linux-mtd@lists.infradead.org; Mon, 12 May 2014 13:47:47 +0000
Message-ID: <5370D0E5.4040800@nod.at>
Date: Mon, 12 May 2014 15:47:17 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Luka Perkov <luka@openwrt.org>, John Crispin <john@phrozen.org>
Subject: Re: [PATCH] UBI: add a ubi forced detach ioctl
References: <1399850250-24616-1-git-send-email-luka@openwrt.org>
 <CAFLxGvy+5udxOnRmEeKbHGr=z3a0H+vK07r+PbQdHiUkcJivQA@mail.gmail.com>
 <53709292.6070600@phrozen.org> <20140512104400.GA24995@w500.lan>
In-Reply-To: <20140512104400.GA24995@w500.lan>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: John Crispin <blogic@openwrt.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 12.05.2014 12:44, schrieb Luka Perkov:
> On Mon, May 12, 2014 at 11:21:22AM +0200, John Crispin wrote:
>> This is a ugly temporary patch that we carry around in openwrt until we
>> have a real fix. why are you trying to upstream this ?
> 
> I didn't think this is a hack, other file systems can force umount as
> well. What are you proposing as a real fix?

You're messing with UBI, not UBIFS. :-)
So, what problem is your patch solving and why do we need it upstream?

Thanks,
//richard
