Received: from mail-qg0-x22c.google.com ([2607:f8b0:400d:c04::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b0CB4-0003fO-CR
 for linux-mtd@lists.infradead.org; Tue, 10 May 2016 18:14:39 +0000
Received: by mail-qg0-x22c.google.com with SMTP id f92so11211127qgf.0
 for <linux-mtd@lists.infradead.org>; Tue, 10 May 2016 11:14:16 -0700 (PDT)
Subject: Re: [PATCH v4 2/2] mtd: mediatek: driver for MTK Smart Device Gen1
 NAND
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1461946642-1842-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1461946642-1842-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20160510141335.442d3d7b@bbrezillon> <5731F5E3.3020607@linaro.org>
Cc: computersforpeace@gmail.com, dwmw2@infradead.org, matthias.bgg@gmail.com,
 robh@kernel.org, linux-mtd@lists.infradead.org, xiaolei.li@mediatek.com,
 linux-mediatek@lists.infradead.org, erin.lo@mediatek.com,
 daniel.thompson@linaro.org, blogic@openwrt.org
From: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Message-ID: <573224F5.4030003@linaro.org>
Date: Tue, 10 May 2016 14:14:13 -0400
MIME-Version: 1.0
In-Reply-To: <5731F5E3.3020607@linaro.org>
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

On 05/10/2016 10:53 AM, Jorge Ramirez wrote:
> On 05/10/2016 08:13 AM, Boris Brezillon wrote:
>>> +
>>> >+void mtk_ecc_disable(struct mtk_ecc *ecc, struct mtk_ecc_config 
>>> *config)
>> If you save the mode somewhere in mtk_ecc (or just write in both ENC
>> and DEC registers), you won't need this extra config arg here.
>
> ok. 

actually as I was implementing this change (and it is a simple change to 
do) I am not sure that it is a good idea to store the state of the 
engine in the ecc_driver (ie: codec_x active sort of flag). And writing 
to both set of registers looks ugly to me.

the way the nand driver is written, it is the nand driver the one that 
controls the ecc engine 'states' (init, enable_x,disable_x). Why do we 
want the ecc engine to remember that it was running the encoder or the 
decoder? I think keeping the parameter in this function makes more 
sense, that way the ecc driver itself completely stateless.

however let me see if there is a register I can poke to find out the 
active codec (then I could remove the config parameter that you pointed 
out without having to store state). I should be able to just read the 
ECC control register to determine this.
