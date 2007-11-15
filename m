Received: from wr-out-0506.google.com ([64.233.184.226])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1IsczN-0002Ht-5l
	for linux-mtd@lists.infradead.org; Thu, 15 Nov 2007 06:34:35 -0500
Received: by wr-out-0506.google.com with SMTP id c8so445362wra
	for <linux-mtd@lists.infradead.org>;
	Thu, 15 Nov 2007 03:34:25 -0800 (PST)
Message-ID: <6b5362aa0711150334v22e8dccdoa59790767076d5ae@mail.gmail.com>
Date: Thu, 15 Nov 2007 17:04:25 +0530
From: "Brijesh Singh" <brijesh.s.singh@gmail.com>
To: "Johnson, Charles F" <charles.f.johnson@intel.com>
Subject: Re: MTD Size Limit
In-Reply-To: <B1EDF20A6EAAD74EA65E46F774F1784502C6D585@orsmsx413.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <Acgb8MRpbB2IBpK7R92C/rQXYHPZ/Q==>
	<B1EDF20A6EAAD74EA65E46F774F1784502C6D585@orsmsx413.amr.corp.intel.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is MTD size limitation.
ubi can support partitions larger than 4GB size,devices without any
change,provided mtd is changed to support larger device size.

If you want fixes for 64 bit mtd support,go through previous mails.

On Nov 1, 2007 12:33 AM, Johnson, Charles F <charles.f.johnson@intel.com> wrote:
> I hear about a size limit for the MTD layer due to a 32 bit size
> variable. So is the limitation 4GBytes ??
>
> If you partition a device using UBI, is this limiation then per
> partition or is it still over the entire device??
>
> Is there any effort to increase the limit.  Particularlly give the large
> NAND flashes that are coming.
>
> Charles Johnson
> Ultra-Mobility Group
> Platform Software Engineering
> Intel Corporation
> charles.f.johnson@intel.com
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
