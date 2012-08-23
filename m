Received: from mail-wi0-f171.google.com ([209.85.212.171])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T4Wlg-0003KT-5M
 for linux-mtd@lists.infradead.org; Thu, 23 Aug 2012 12:44:13 +0000
Received: by wibhq4 with SMTP id hq4so707840wib.0
 for <linux-mtd@lists.infradead.org>; Thu, 23 Aug 2012 05:44:08 -0700 (PDT)
Date: Thu, 23 Aug 2012 15:44:04 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: dedekind1@gmail.com
Subject: Re: [PATCH v3 0/6] UBI: add max_beb_per1024 parameter / ioctl
Message-ID: <20120823154404.51e31873@pixies.home.jungo.com>
In-Reply-To: <1345725030.2848.236.camel@sauron.fi.intel.com>
References: <1345478416-23900-1-git-send-email-richard.genoud@gmail.com>
 <1345716615.2848.229.camel@sauron.fi.intel.com>
 <20120823133655.72157b18@pixies.home.jungo.com>
 <1345725030.2848.236.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Richard Genoud <richard.genoud@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Thu, 23 Aug 2012 15:30:30 +0300 Artem Bityutskiy <dedekind1@gmail.com> wrote:
> From fa7595564e95672ab87d4a910c6bc02123b75e88 Mon Sep 17 00:00:00 2001
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Date: Thu, 23 Aug 2012 13:01:11 +0300
> Subject: [PATCH] UBI: disallow max_beb_per1024 on NOR flash
> 
> If the flash does not admit of bad blocks (e.g., NOR) - disallow using
> 'max_beb_per1024'.
> 
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> ---
> 
> Second attempt, did not test :-)

Looks ok to me.

Reviewed-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
