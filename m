Received: from mail-qg0-x22e.google.com ([2607:f8b0:400d:c04::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b09iw-0006M0-E1
 for linux-mtd@lists.infradead.org; Tue, 10 May 2016 15:37:27 +0000
Received: by mail-qg0-x22e.google.com with SMTP id f92so8529755qgf.0
 for <linux-mtd@lists.infradead.org>; Tue, 10 May 2016 08:37:06 -0700 (PDT)
Subject: Re: [PATCH v4 2/2] mtd: mediatek: driver for MTK Smart Device Gen1
 NAND
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1461946642-1842-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1461946642-1842-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20160510141335.442d3d7b@bbrezillon> <5731F537.9040009@linaro.org>
 <20160510171353.1697cb8a@bbrezillon>
Cc: computersforpeace@gmail.com, dwmw2@infradead.org, matthias.bgg@gmail.com,
 robh@kernel.org, linux-mtd@lists.infradead.org, xiaolei.li@mediatek.com,
 linux-mediatek@lists.infradead.org, erin.lo@mediatek.com,
 daniel.thompson@linaro.org, blogic@openwrt.org
From: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Message-ID: <5732001F.5030508@linaro.org>
Date: Tue, 10 May 2016 11:37:03 -0400
MIME-Version: 1.0
In-Reply-To: <20160510171353.1697cb8a@bbrezillon>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/10/2016 11:13 AM, Boris Brezillon wrote:
>> >just as needed by the hardware:
>> >the config is in bits, the encoder register requires bytes, the decoder
>> >register requires bits.
>> >
> Are you sure about that? Cause it seems to me that the NAND controller
> drivers put a length in bits in ->dec_len and a length in bytes in
> ->enc_len, and then you have an extra conversion in the ECC engine
> driver code for enc_len to convert it into a value in bits.

yes you are right (was reading at the spec before to be sure but the 
spec is wrong since the driver works...yes I remember now discussing 
this with mediatek).
"ENC_MS: indicates the total bytes size of message block. the message 
block can only be in byte unit." - yes, this line of the spec is wrong.

will fix the code to make it consistent on the config interface (both 
enc_len or dec_len should be the same unit); and in fact as you also 
pointed out we only need one len parameter since the decoder len can be 
deduced from the encoder using the strength and the number of parity bits.

thanks!
