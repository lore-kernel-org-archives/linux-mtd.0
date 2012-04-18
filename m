Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SKSRG-0002Ts-Kh
 for linux-mtd@lists.infradead.org; Wed, 18 Apr 2012 10:48:43 +0000
Received: by lagy4 with SMTP id y4so6345356lag.36
 for <linux-mtd@lists.infradead.org>; Wed, 18 Apr 2012 03:48:40 -0700 (PDT)
Message-ID: <4F8E9C04.1090105@gmail.com>
Date: Wed, 18 Apr 2012 16:48:36 +0600
From: Alexey Galakhov <agalakhov@gmail.com>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?=22DEGETEL_-_DONNETTE=2C_Beno=EEt=22?=
 <BDONNETT@bouyguestelecom.fr>, linux-mtd@lists.infradead.org
Subject: Re: S5PC100/S5PV210 NAND controller support
References: <4F8E8AE0.2020603@gmail.com>
 <9E63AD4284D3A34EB555C5876F86F895349812D26A@BT1FMSGS11.bt0d0000.w2k.bouyguestelecom.fr>
In-Reply-To: <9E63AD4284D3A34EB555C5876F86F895349812D26A@BT1FMSGS11.bt0d0000.w2k.bouyguestelecom.fr>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

By reading S5PV210 datasheet I discovered that its NAND controller is
very similar to the one of S3C2410. The former is already supported well.

Looks that there's no need for a new separate driver, provided that the
old one is aware of S5Pxxx chips.

-- 
Alex

On 18.04.2012 16:02, DEGETEL - DONNETTE, Benoît wrote:
> Hello,
> 
> I wonder if they should go through staging at first, should they not ? The patch isn't present in 3.3.2 for the moment.
> 
> B. Donnette
