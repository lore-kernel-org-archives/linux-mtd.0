Received: from mo-p05-ob6.rzone.de ([2a01:238:20a:202:53f5::1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SALMH-0007e8-Se
 for linux-mtd@lists.infradead.org; Wed, 21 Mar 2012 13:13:48 +0000
From: Stefan Roese <sr@denx.de>
To: linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 2/2] MTD: Add device-tree support to spear_smi
Date: Wed, 21 Mar 2012 14:12:59 +0100
References: <1331894531-21411-1-git-send-email-sr@denx.de>
In-Reply-To: <1331894531-21411-1-git-send-email-sr@denx.de>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201203211413.00013.sr@denx.de>
Cc: Viresh Kumar <viresh.kumar@st.com>, devicetree-discuss@ozlabs.org,
 spear-devel@list.st.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On Friday 16 March 2012 11:42:11 Stefan Roese wrote:
> This patch adds support to configure the SPEAr SMI driver via
> device-tree instead of platform_data.

I noticed that you pushed the first part of this patch:

[PATCH 1/2] MTD: spear_smi: Remove default partition information from driver

into l2-mtd.git. What's do plan for this patch?

Thanks,
Stefan
