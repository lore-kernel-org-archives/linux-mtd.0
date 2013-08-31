Received: from mail-pb0-x234.google.com ([2607:f8b0:400e:c01::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VFa8T-00074m-1M
 for linux-mtd@lists.infradead.org; Sat, 31 Aug 2013 01:37:57 +0000
Received: by mail-pb0-f52.google.com with SMTP id wz12so2509022pbc.25
 for <linux-mtd@lists.infradead.org>; Fri, 30 Aug 2013 18:37:35 -0700 (PDT)
Date: Sat, 31 Aug 2013 09:42:38 -0400
From: Huang Shijie <shijie8@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 04/25] mtd: nand: gpmi-nand: janitorial cleanup: (commas
 after last element of struct initializer)
Message-ID: <20130831134236.GB22069@gmail.com>
References: <1375279887-17928-1-git-send-email-LW@KARO-electronics.de>
 <1375279887-17928-2-git-send-email-LW@KARO-electronics.de>
 <51F9C4C2.8040403@freescale.com>
 <20985.63269.929367.546435@ipc1.ka-ro>
 <1377879189.22372.65.camel@shinybook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1377879189.22372.65.camel@shinybook.infradead.org>
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW@KARO-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 30, 2013 at 05:13:09PM +0100, David Woodhouse wrote:
> On Thu, 2013-08-01 at 07:50 +0200, Lothar Waßmann wrote:
> 
> Now, admittedly that's the *general* case, and the ones you've removed
> commas from are very unlikely to ever have new members added after them.
> Especially the one that's a NULL sentinel at the end of an ID match
> list. But I'm just not sure I approve of the concept of removing the
> commas. I'm happier with them present, and a general habit of including
> them.

Hi David:
   thanks for explanations.

   If you do not like this patch, you can remove it.


thanks
Huang Shijie
