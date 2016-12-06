Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cECCY-0003GL-9f
 for linux-mtd@lists.infradead.org; Tue, 06 Dec 2016 09:38:20 +0000
Subject: Re: UBIFS crash in power cutting test
To: Rock Lee <rockdotlee@gmail.com>,
 Richard Weinberger <richard.weinberger@gmail.com>
References: <CAL-1w2vQHnuDmo-5bsE=Lc-uPpVy4vPU7tNmwkcEasB9uvAZ3A@mail.gmail.com>
 <CAFLxGvwKKqOWn2Eb06z0JaNo2vxhgi4somVw8bgkFrvtDPY5uw@mail.gmail.com>
 <CAL-1w2tro0Zsybz8eBE22LXd_LV6ReFbT+4WDxU9z0NWFLY=bw@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <88af03f9-a222-b38e-9cbe-eb38e09248ed@nod.at>
Date: Tue, 6 Dec 2016 10:37:50 +0100
MIME-Version: 1.0
In-Reply-To: <CAL-1w2tro0Zsybz8eBE22LXd_LV6ReFbT+4WDxU9z0NWFLY=bw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06.12.2016 09:49, Rock Lee wrote:
>> does the flash function correctly?
>> IOW do both MTD and UBI tests pass?
> Sorry, I haven't tested MTD & UBI yet, but when UBIFS crashes, there
> is no MTD & UBI error message.
> 
>> Are you using xattrs?
> Yes, I used xattrs (smack on root), and specifed  smackfsdef='_' to
> ubifs mount options.
> 

I suspect a bug in the UBIFS xattr code. I saw such a report some
time ago but the reporter disappeared before I was able to hunt to the issue down.

When you face the crash, is is persistent or does it go away after a reset?
If it stays, can you share me the filesystem?

Thanks,
//richard
