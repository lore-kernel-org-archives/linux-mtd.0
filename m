Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by merlin.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cOoaT-0008Qj-MI
 for linux-mtd@lists.infradead.org; Wed, 04 Jan 2017 16:38:54 +0000
Received: by mail-wm0-x244.google.com with SMTP id u144so92333994wmu.0
 for <linux-mtd@lists.infradead.org>; Wed, 04 Jan 2017 08:38:33 -0800 (PST)
Subject: Re: [PATCH v4 05/15] mtd: nand: add manufacturer specific
 initialization/detection steps
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
References: <1483448495-31607-1-git-send-email-boris.brezillon@free-electrons.com>
 <1483448495-31607-6-git-send-email-boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, Icenowy Zheng
 <icenowy@aosc.xyz>, Valdis.Kletnieks@vt.edu, linux-kernel@vger.kernel.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <ec43449a-f1e3-35ff-0d3a-742b94248a77@gmail.com>
Date: Wed, 4 Jan 2017 16:07:55 +0100
MIME-Version: 1.0
In-Reply-To: <1483448495-31607-6-git-send-email-boris.brezillon@free-electrons.com>
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

On 01/03/2017 02:01 PM, Boris Brezillon wrote:
> A lot of NANDs are implementing generic features in a non-generic way,
> or are providing advanced auto-detection logic where the NAND ID bytes
> meaning changes with the NAND generation.
> 
> Providing this vendor specific initialization step will allow us to get
> rid of the full ids in the nand_ids table or all the vendor specific
> cases added over the time in the generic NAND ID decoding logic.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>

[...]

Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

-- 
Best regards,
Marek Vasut
