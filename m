Received: from wf-out-1314.google.com ([209.85.200.172])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LDPQ9-0007zr-Oh
	for linux-mtd@lists.infradead.org; Thu, 18 Dec 2008 20:24:34 +0000
Received: by wf-out-1314.google.com with SMTP id 28so617862wfc.24
	for <linux-mtd@lists.infradead.org>;
	Thu, 18 Dec 2008 12:24:32 -0800 (PST)
Message-ID: <8bd0f97a0812181224w450cb529l9108eaddbf66081c@mail.gmail.com>
Date: Thu, 18 Dec 2008 15:24:32 -0500
From: "Mike Frysinger" <vapier.adi@gmail.com>
To: dedekind@infradead.org
Subject: Re: [PATCH 0/2] mtd-utils export libraries
In-Reply-To: <1229611038.30575.11.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <52e42efe0812180615u19344697la740e4ca1a060aff@mail.gmail.com>
	<1229611038.30575.11.camel@sauron>
Cc: linux-mtd@lists.infradead.org, Sidney Amani <amani_s@epitech.net>,
	Mike Frysinger <vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 18, 2008 at 09:37, Artem Bityutskiy wrote:
> On Thu, 2008-12-18 at 15:15 +0100, Sidney Amani wrote:
>> We are currently working on an UBI based userspace filesystem.
>>
>> We wanted to use libubi. So here is our patch to export shared
>> libraries and headers. This is done for each library in LIBS.
>
> Hi, thanks for the patches. However, Mike (CCed) sent a major build
> system rework patch recently, but there was an issue and I am waiting
> for a new patch from him. Mike, could you please let me know if I
> should wait for a new version of your patch or try to apply these
> ones?

i think the first question is, is this actually desirable.  a shared
library implies stable ABI and a thought out API.  if neither of these
have been done, but you still want to export the libs, the first thing
to do would be to just export PIC static libs.
-mike
