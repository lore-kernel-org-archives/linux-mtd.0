Received: from mail-gx0-f177.google.com ([209.85.161.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PBGzT-0002hW-N9
	for linux-mtd@lists.infradead.org; Thu, 28 Oct 2010 01:09:16 +0000
Received: by gxk25 with SMTP id 25so982462gxk.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 27 Oct 2010 18:09:13 -0700 (PDT)
Message-ID: <4CC8CD2B.2040801@gmail.com>
Date: Wed, 27 Oct 2010 18:08:59 -0700
From: Brian Norris <computersforpeace@gmail.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH v2 1/2] mtd-utils: nanddump/nandwrite: style, signed-ness,
	printing fixups
References: <1287645577-13538-1-git-send-email-computersforpeace@gmail.com>	
	<1287645577-13538-2-git-send-email-computersforpeace@gmail.com>
	<1288034112.1865.7.camel@brekeke>
In-Reply-To: <1288034112.1865.7.camel@brekeke>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/25/2010 12:15 PM, Artem Bityutskiy wrote:
> Mike is right, it is much better to separate functional and cleanup
> changes, even split different clean-up changes into several patches.
> Maintaining this stuff and reviewing patches takes time, and splitting
> helps a lot. Let's push this patch but please, try to splint patches on
> more smaller pieces. Yes, it'll be more work for you, but less for me.
> But when submitters take more burden and maintainer less - the system
> scales better. Take into account that I'm doing this stuff just because
> I like MTD and do not like see people's patches lost, so little help in
> form of perfectly split micro-patches is appreciated.
> 
> Pushed, thanks!

Right, this makes perfect sense. I will remind myself of this for future
patches. I certainly don't want to make things more difficult than
necessary for you!

Oh, and thanks for the push.

Brian
