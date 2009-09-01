Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MiPHf-00010D-OS
	for linux-mtd@lists.infradead.org; Tue, 01 Sep 2009 09:04:16 +0000
Subject: Re: [PATCH] [MTD] CHIPS: buffer size adjustment for M29EW Numonyx
	devices
From: Artem Bityutskiy <dedekind1@gmail.com>
To: massimo cirillo <maxcir@gmail.com>
In-Reply-To: <62cbdcd90908280105w73941da1p211b1b9248bbd275@mail.gmail.com>
References: <62cbdcd90908270313i5a45cb4aw6f34477a798bdbfe@mail.gmail.com>
	<62cbdcd90908280105w73941da1p211b1b9248bbd275@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 01 Sep 2009 12:03:16 +0300
Message-Id: <1251795796.3514.22.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-08-28 at 10:05 +0200, massimo cirillo wrote:
> From: Massimo Cirillo <maxcir@gmail.com>
> 
> Please, consider this new version of the patch, that leaves unchanged
> the cfi->id value for AMD devices.
> 
> Signed-off-by: Massimo Cirillo <maxcir@gmail.com>

Please, resend a patch with proper descriptions, without indentation
problems (see int extendedId1) and without adding junk \n lines:

> +
> +

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
