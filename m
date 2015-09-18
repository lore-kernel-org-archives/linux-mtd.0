Received: from mail-ob0-f174.google.com ([209.85.214.174])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zd2sE-0005JH-9s
 for linux-mtd@lists.infradead.org; Fri, 18 Sep 2015 21:07:15 +0000
Received: by obbmp4 with SMTP id mp4so12342874obb.3
 for <linux-mtd@lists.infradead.org>; Fri, 18 Sep 2015 14:06:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAOMZO5C7GBZ0SgqOeb5fxfNWZ6P=jonJYrzzC-36vxcw_mFpbA@mail.gmail.com>
References: <loom.20150918T183854-37@post.gmane.org>
 <CAOMZO5Bf6QjNVa1W=8ognoWRnG2Ct2W8Xs4++-7OMOLR6dikiA@mail.gmail.com>
 <CA+-FG62+vpJiuxNegEDd6sZ7oqfcrv_EWqa4skuoSXWzM-Ea3g@mail.gmail.com>
 <CAOMZO5C7GBZ0SgqOeb5fxfNWZ6P=jonJYrzzC-36vxcw_mFpbA@mail.gmail.com>
Date: Fri, 18 Sep 2015 17:06:53 -0400
Message-ID: <CA+-FG60tS+u0Ck+Vmsw6BS1RnG1OBL7HN=nd-9eCtXBJtTFysg@mail.gmail.com>
Subject: Re: UBIFS corruptions on NOR-Flash
From: Roshni Shah <roshni.shah@timesys.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 stefan@agner.ch, bhuvanchandra.dv@toradex.com
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Fabio,

Thanks for pointing me to those discussions. The changes there are for
the NAND driver, however I am testing with the NOR flash (s25fl128s).

I will take a look at the suggested fix if there is anything
applicable for NOR too.

Thanks,
Roshni

On Fri, Sep 18, 2015 at 4:02 PM, Fabio Estevam <festevam@gmail.com> wrote:
> [Adding Stefan and Bhuvan]
>
> On Fri, Sep 18, 2015 at 4:51 PM, Roshni Shah <roshni.shah@timesys.com> wrote:
>> Hi Fabio,
>>
>> I haven't tried 4.2 or 4.3-rc1 on this custom board. However, I have
>> tried 4.1-rc5 on Vybrid TWR (same NOR chip, qspi interface, Vybrid
>> processor as the custom board) and I saw the same issues as described
>> in the first post.
>>
>> if there are specific fixes in 4.2 or 4.3-rc1, I could try them on
>> both them on the custom board / Vybrid TWR board.  Let me know.
>
> Please check:
>
> http://lists.infradead.org/pipermail/linux-mtd/2015-September/061601.html
>
> http://lists.infradead.org/pipermail/linux-mtd/2015-September/061585.html
