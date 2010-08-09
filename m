Received: from dcn237-231.dcn.davis.ca.us ([168.150.237.231]
	helo=rusty.jkmicro.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OiZme-0007oj-5R
	for linux-mtd@lists.infradead.org; Mon, 09 Aug 2010 21:21:24 +0000
Received: from [10.10.1.107] (dcn237-230.dcn.davis.ca.us [168.150.237.230])
	by rusty.jkmicro.com (8.12.8/8.12.8) with ESMTP id o79KTf99028428
	for <linux-mtd@lists.infradead.org>; Mon, 9 Aug 2010 13:29:41 -0700
Message-ID: <4C607150.6040806@jkmicro.com>
Date: Mon, 09 Aug 2010 14:21:20 -0700
From: Adam Yergovich <ayergo@jkmicro.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: buffer write error (status 0x90)
References: <AANLkTikPQfNJ9eZeF6scpnx5beVt=dR6pfNgqcExteMu@mail.gmail.com>
In-Reply-To: <AANLkTikPQfNJ9eZeF6scpnx5beVt=dR6pfNgqcExteMu@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jon Ringle wrote:
> We are replacing the discontinued Intel StrataFlash P30 flash
> JS28F256P30T95 with the Numonyx P30-65nm flash JS28F256P30TF on our
> boards and have a few boards with sample chips. During some testing
> one of the boards with the Numonyx flash chip is now reporting the
> following buffer write error (status 0x90) on every boot:

I have tested swapping the lower density part and haven't had any 
problems with MTD or otherwise.  I suspect you've just got a bad part or 
something else happened.

-Adam

-- 
Adam Yergovich
Engineer
JK Microsystems

1403 Fifth St. Suite D
Davis, CA 95616

Tel:(530) 297-6073
