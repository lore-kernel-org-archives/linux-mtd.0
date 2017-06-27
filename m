Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dPqlG-0006wo-15
 for linux-mtd@lists.infradead.org; Tue, 27 Jun 2017 13:42:36 +0000
Subject: Re: [RFC] ubihealthd
To: "Bean Huo (beanhuo)" <beanhuo@micron.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <f9de52c909c44f5daa7bcb154ec27e2e@SIWEX5A.sing.micron.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <dfd0b51c-d878-5ffe-f9f6-b6aae9827562@nod.at>
Date: Tue, 27 Jun 2017 15:42:11 +0200
MIME-Version: 1.0
In-Reply-To: <f9de52c909c44f5daa7bcb154ec27e2e@SIWEX5A.sing.micron.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Bean,

Am 27.06.2017 um 15:35 schrieb Bean Huo (beanhuo):
> Hi, Richard
> I see ubihealthd tool doesn't merge in to mainline MTD-utils, also the kernel 
> " UBI statistics and bitrot interface".  
> http://lists.infradead.org/pipermail/linux-mtd/2015-November/063122.html
> I have a little bit confusion.  What is it difference with your patch series " UBI: Bitrot checking "?
> http://lists.infradead.org/pipermail/linux-mtd/2015-November/063122.html

this is two times the same link.
The most recent series is the latest approach. I sent multiple approaches.

> the ubihealthd is a user space tool and can trigger re-reads and scrubbing.
> I see " UBI: Bitrot checking " also has this action. They are separate or working together?
> Can you please provide more information about both?

The planned mode was that all logic happens in userspace, therefore ubihealthd.

Thanks,
//richard
