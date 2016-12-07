Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cEf9v-0006qc-TP
 for linux-mtd@lists.infradead.org; Wed, 07 Dec 2016 16:33:35 +0000
Received: by mail-wm0-x243.google.com with SMTP id m203so28841007wma.3
 for <linux-mtd@lists.infradead.org>; Wed, 07 Dec 2016 08:33:11 -0800 (PST)
Subject: Re: [PATCH 1/2] mtd: spi-nor: rename SPINOR_OP_* macros of the 4-byte
 address op codes
To: Mark Brown <broonie@kernel.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
References: <cover.1481041702.git.cyrille.pitchen@atmel.com>
 <54697ac9604b8e769f92dd4fb392db952df9eae4.1481041702.git.cyrille.pitchen@atmel.com>
 <20161207095148.glwlxbd2tatr7axo@sirena.org.uk>
Cc: computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 richard@nod.at, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <be0718c0-b463-79e0-53b9-d85b29f24465@gmail.com>
Date: Wed, 7 Dec 2016 17:08:46 +0100
MIME-Version: 1.0
In-Reply-To: <20161207095148.glwlxbd2tatr7axo@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/07/2016 10:51 AM, Mark Brown wrote:
> On Tue, Dec 06, 2016 at 05:52:31PM +0100, Cyrille Pitchen wrote:
>> This patch renames the SPINOR_OP_* macros of the 4-byte address
>> instruction set so the new names all share a common pattern: the 4-byte
>> address name is built from the 3-byte address name appending the "_4B"
>> suffix.
> 
> Acked-by: Mark Brown <broonie@kernel.org>
> 
It's certainly less confusing naming, so

Acked-by: Marek Vasut <marek.vasut@gmail.com>

-- 
Best regards,
Marek Vasut
