Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cLRHc-0004n1-Co
 for linux-mtd@lists.infradead.org; Mon, 26 Dec 2016 09:09:29 +0000
Subject: Re: UBIFS crash in power cutting test
To: Rock Lee <rockdotlee@gmail.com>
References: <CAL-1w2vQHnuDmo-5bsE=Lc-uPpVy4vPU7tNmwkcEasB9uvAZ3A@mail.gmail.com>
 <CAFLxGvwKKqOWn2Eb06z0JaNo2vxhgi4somVw8bgkFrvtDPY5uw@mail.gmail.com>
 <CAL-1w2tro0Zsybz8eBE22LXd_LV6ReFbT+4WDxU9z0NWFLY=bw@mail.gmail.com>
 <88af03f9-a222-b38e-9cbe-eb38e09248ed@nod.at>
 <CAL-1w2vH681jKYFFz_h=L5ajZ2mRebXxp8gxLjoqMwXGk8aJ9g@mail.gmail.com>
 <937cc2da-b74b-6cfc-96ff-baf6128eb987@nod.at>
 <CAL-1w2v2AYDjkFTR=FbtiJNHeUYcfxi6C+Sdgr5ZJo0W2Vw-ow@mail.gmail.com>
 <f1be2e3f-98d5-b574-d4d6-b5fecf385ff8@nod.at>
 <CAL-1w2t4espFhASRTe+qrisYsL+GAUqV-+rV6vW3P-bQjJnrSQ@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <6d433424-23d4-3554-c73d-4fa1f0a6045e@nod.at>
Date: Mon, 26 Dec 2016 10:09:01 +0100
MIME-Version: 1.0
In-Reply-To: <CAL-1w2t4espFhASRTe+qrisYsL+GAUqV-+rV6vW3P-bQjJnrSQ@mail.gmail.com>
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

Hi!

On 26.12.2016 07:39, Rock Lee wrote:
> hi, Richard:
> After days investigating on this issue, I found this email which
> describe the same problem.
> And you replied that problem. :-)
> 
> https://patchwork.ozlabs.org/patch/369329/
> 
> But it seems that patch doesn't merged in UBIFS, why is that?

AFAIK because the patch is a hack and does not address the root cause.
As I said in my last mails, I'll dig into the issue after the merge window
(and xmas).

Thanks,
//richard
