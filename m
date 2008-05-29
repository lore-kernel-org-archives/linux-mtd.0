Received: from wf-out-1314.google.com ([209.85.200.169])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K1d5F-0007wU-N0
	for linux-mtd@lists.infradead.org; Thu, 29 May 2008 08:02:01 +0000
Received: by wf-out-1314.google.com with SMTP id 28so3098860wfc.24
	for <linux-mtd@lists.infradead.org>;
	Thu, 29 May 2008 01:02:00 -0700 (PDT)
Message-ID: <bae050c10805290101s4467bb39u95cd9fe0a55f883@mail.gmail.com>
Date: Thu, 29 May 2008 16:01:58 +0800
From: Nancy <nancydreaming@gmail.com>
To: mhfan@hhcn.com
Subject: Re: mkfs.ubifs, ubinize, ubiupdatevol request!
In-Reply-To: <483E5C97.2000100@hhcn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <bae050c10805290002gb294d4yf5a62a4331225dbc@mail.gmail.com>
	<483E5C97.2000100@hhcn.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5/29/08, Meihui Fan <mhfan@hhcn.com> wrote:
>
> Hi Nancy,
>
> I don't know the difference between mkfs.vfat and windows fast fat32 format
> program, but  in my experience, I think there are two arguments for
> mkfs.vfat which would impact the block access performance: -s and/or -S,
> please try to specify a big value for these two arguments.
>
> Hopeful this would help.

I have tried several pair, but none was same as winodws fast fat32
format program.
Would you please give me an example?

By the way, are you using my ubiblk patch now? Have you meet the same
speed problem? How do you solve it?

Thank you for your reply :-)

-- 
Best wishes,
Nancy
