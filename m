Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ctDPa-00005d-Fm
 for linux-mtd@lists.infradead.org; Wed, 29 Mar 2017 13:13:21 +0000
Subject: Re: mtd-utils: various fixes, apply OpenEmbedded patches
To: Andrea Adami <andrea.adami@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
References: <20170322102257.7605-1-david.oberhollenzer@sigma-star.at>
 <20170322161323.22b7489c@free-electrons.com>
 <1b4bbd29-c93e-3e75-b01d-7b7b2ac93385@sigma-star.at>
 <20170323104556.185f92e0@free-electrons.com>
 <CAAQYJAub6XGjsSg4Ri6qk6xkrGdrRfzAGqfqf6EJ7UVU_H_RpQ@mail.gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Yuanjie.Huang@windriver.com,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Khem Raj <raj.khem@gmail.com>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Message-ID: <9fb078be-29a7-84e5-da5f-cb88beb05601@sigma-star.at>
Date: Wed, 29 Mar 2017 15:12:53 +0200
MIME-Version: 1.0
In-Reply-To: <CAAQYJAub6XGjsSg4Ri6qk6xkrGdrRfzAGqfqf6EJ7UVU_H_RpQ@mail.gmail.com>
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

As there were no complaints about the patches I posted last week, I
applied them to mtd-utils.git.


On 03/23/2017 11:57 AM, Andrea Adami wrote:
> Hi,
> while you're reviewing old patches please note there are some little
> klibc fixes for 1.52 here:
> 
> http://cgit.openembedded.org/meta-openembedded/tree/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc
> 
> Probably you could consider the fixes for rpmatch() and getline(). Unsure about
> iniparser_getdouble.
> 
> Thanks
> Andrea
> 

I took a look at those. The Makefile patches aren't really relevant
anymore, after the switch to Autotools (also, as noted in the patch,
the first one is very specific for your use case).

The PRIxoff_t/PRIdoff_t patch (number 4) doesn't apply anymore. From a
brief look at the log it appears that the format specifies have been
fixed at least 3 times after the date of your patch. The current
version uses autoconf to determine the sizeof off_t and loff_t. The
header sets the format specifers based on the size only, so this
_should_ make magic libc vendor/feature checks obsolete.

As for the prompt() patch (number 5), the use of rpmatch() has recently
been removed. I would hesitate removing the use of getline() as proposed
in the patch, first of all the proposed patch would alter the behavior
of prompt() if more than one character was entered and second, getline
has actually been accepted into the standard some ~9 years ago.[1]


If there are no objections, I'll apply the libubi ioctl and
libiniparser patches (number 3 and 6 respectively).


Thanks,

David

[1] http://pubs.opengroup.org/onlinepubs/9699919799/functions/getdelim.html
