Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 765E3C77B7C
	for <linux-mtd@archiver.kernel.org>; Wed, 31 May 2023 09:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NoPX+shQbYbAtY7/inIH+gyxbuQEQaQKpsQjTp3nhww=; b=wnHuMLtN0MFLMS0PdmL6Tjizux
	P2h0qiKRTu1D8lu1ujkRVdXDkpvgkYEEx83yem4iStgsVFfUtROYX5SFtpZTaVfJFuPqX8ujMuBt4
	vcdODhnzHe1kRVoKEaoRgtN69+CFpKxzqIE7rUJNfkKyLmG828hN+9PAVPahu1GTvKqooK4aTDQAy
	kh0H/BvIL/fqtqrjURGl6fN05RVBQKlsJlFX4InAFyQ1EK06sQ6NGorSxDUbF+E6IjDJeASC/98hS
	fGjtSrK1kiW2qcWY/LZa3tsFokhLRE7m/1NZJ4W6lG4UbyZZQI3ovIuT9T2eoR4NIda7b9Kzb/f+M
	mjHwjZzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4Hiv-00GnvW-1M;
	Wed, 31 May 2023 09:02:29 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4Hir-00Gntl-1l
	for linux-mtd@lists.infradead.org;
	Wed, 31 May 2023 09:02:27 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-19f31d6b661so3859379fac.0
        for <linux-mtd@lists.infradead.org>; Wed, 31 May 2023 02:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685523742; x=1688115742;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+fsuNMzqAUy5scImt9eojmBjYIkfwAHmF4dSVKUX1q0=;
        b=PjxI+Uh6K1lIOR4wSA16sKAOJ8zfuCmA+8pi00a7gY18uRuU4nGApbm5xdLMU1Oq84
         XaBm9maL9QiKN+a7WXoPqPhqz0ysklJFTGQInJxfEr1VOg79mERJ0r5gDz9tJusNO7jg
         xXj985nIB5EsAAh5RQYItyWuUF2gDxh20WjvwvC7tUxsAdtbbQPgdzHVsij9lZM1N0w1
         J1fF4rIO5+x6rwnG0pSlXRoSSFftOcHi2C0iURPsYvOITAMv+C//2bQCV8o801zWAoi2
         0iD/dsHxWYqfw/gvosn+hlavT1R0n0GN11Gu1KAUDDuYbkipM8O+tGNbU+8rgSXgp7vE
         O0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685523742; x=1688115742;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+fsuNMzqAUy5scImt9eojmBjYIkfwAHmF4dSVKUX1q0=;
        b=eMd+5GvZ7NLyKwXIYNrPNQOo6pZBDPY5JVWFJYDOg1sqeDmulOkhR7XVHJ8KLNIhoL
         r4tNoJmREPnwwhYo3XvPgZ4ePcGKrRV82x3TW6LIAGPlZSk4Tpom4u5T2q/twC51hnas
         JjIV2I9dB7Qglhejv/KOjbTskw5HIqIYwpcRdF1W5ZyOjIJDRiAoZzhIx8knsCA7jNEb
         9Qx7xvkYvfHeue8avl2w9Vf0RQauxSx3xgluIX/RlLr9zTakAsoWOh6yq4idM0s2F1zY
         uQmEGUPaxCteYhN/zCIm+SJomtIFo1JPPFOF5SHnyTp40D4CWBZNczsoulmDmaP2RkqH
         /lAQ==
X-Gm-Message-State: AC+VfDw91PVb2SVAzc5W9xVla8bfpAdo43R8BFSsGk9sg+zFFIYvgV1l
	KOQrJwyU5+CwZwkyTwd5Yi2MA2pO9CV15luQNMg=
X-Google-Smtp-Source: ACHHUZ4JMkss7wj2KEzkfiM78lbcfgNJ22dn9DNLbpCBOyOE5t23bdr2WOaXSC13KzxMfn07Tj+r21W1zC1vtBVD8sA=
X-Received: by 2002:a05:6358:5291:b0:125:4dd9:cf23 with SMTP id
 g17-20020a056358529100b001254dd9cf23mr1566485rwa.12.1685523740093; Wed, 31
 May 2023 02:02:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAP1tNvS=NVAm-vfvYWbc3k9Cx9YxMc2uZZkmXk8h1NhGX877Zg@mail.gmail.com>
 <20230526201420.231092a0@xps-13> <CAP1tNvQsmYKMHZ662f1yiLv2JmZZrnQsJr2Lf5xiafxJSkZfBQ@mail.gmail.com>
 <20230529101240.53065e04@xps-13> <CAP1tNvRTRkXMztGL=nxrd-Cv5xO58-R=A_M2r65d6cyidoVz0g@mail.gmail.com>
 <20230529134619.255d0b07@xps-13> <PH0PR08MB788936E00C0DD958BFB9B3F6DB4B9@PH0PR08MB7889.namprd08.prod.outlook.com>
In-Reply-To: <PH0PR08MB788936E00C0DD958BFB9B3F6DB4B9@PH0PR08MB7889.namprd08.prod.outlook.com>
From: Alexander Shiyan <eagle.alexander923@gmail.com>
Date: Wed, 31 May 2023 12:02:08 +0300
Message-ID: <CAP1tNvQg+3O6LOaAnAMXionvLUy2FkF7yWtjXUma-ZLL3EE7nQ@mail.gmail.com>
Subject: Re: [EXT] Re: Boot failed after patch "mtd: rawnand: Support for
 sequential cache reads"
To: Bean Huo <beanhuo@micron.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, JaimeLiao <jaimeliao.tw@gmail.com>, 
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: multipart/mixed; boundary="000000000000caeb8605fcf99305"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_020225_608906_843DF533 
X-CRM114-Status: GOOD (  39.51  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--000000000000caeb8605fcf99305
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello.

I'm not very sure what I should have measured and how to catch the right mo=
ment.
Here's what happened: The first shot was taken immediately after the
board was launched,
the second before the kernel crashes. Yellow beam - R/~B, blue - AD1.

=D0=B2=D1=82, 30 =D0=BC=D0=B0=D1=8F 2023=E2=80=AF=D0=B3. =D0=B2 17:49, Bean=
 Huo <beanhuo@micron.com>:
>
> Hi Miquel,
>
> Thanks for reaching out me, here has a TN-29-01: Increasing NAND Flash Pe=
rformance.
> https://media-www.micron.com/-/media/client/global/documents/products/tec=
hnical-note/nand-flash/tn2901.pdf?rev=3Da228fd154c274ef78669b67ea097ecda
>
>
> If Alexander can do tracing with oscilloscope on the parallel NAND bus, t=
hat would be help to check if this is the timing issue.
>
> Kind regards,
> Bean
>
> > -----Original Message-----
> > From: Miquel Raynal <miquel.raynal@bootlin.com>
> > Sent: Monday, May 29, 2023 1:46 PM
> > To: Alexander Shiyan <eagle.alexander923@gmail.com>
> > Cc: JaimeLiao <jaimeliao.tw@gmail.com>; linux-mtd@lists.infradead.org; =
Bean Huo
> > <beanhuo@micron.com>
> > Subject: [EXT] Re: Boot failed after patch "mtd: rawnand: Support for s=
equential
> > cache reads"
> >
> > CAUTION: EXTERNAL EMAIL. Do not click links or open attachments unless =
you
> > recognize the sender and were expecting this message.
> >
> >
> > Hi Bean,
> >
> > I'm adding you to this thread because I'm clueless regarding what's hap=
pening to
> > Alexander.
> >
> > Short recap: sequential page reads seem to fail with an MT29F Micron ch=
ip.
> > Alexander is using a gpmc controller without on-die ECC, I doubt the er=
ror comes
> > from the controller, so I would like to know if there is anything known=
 to fail with
> > these chips regarding the use of sequential reads. We can easily work a=
round that
> > situation if we identify the problem.
> >
> > Thanks a lot,
> > Miqu=C3=A8l
> >
> > eagle.alexander923@gmail.com wrote on Mon, 29 May 2023
> > 13:33:04 +0300:
> >
> > > =D0=BF=D0=BD, 29 =D0=BC=D0=B0=D1=8F 2023=E2=80=AF=D0=B3. =D0=B2 11:12=
, Miquel Raynal <miquel.raynal@bootlin.com>:
> > > ...
> > > According to the MT29F2G08ABAEAWP datasheet, the chip supports
> > > > > the READ PAGE CACHE SEQUENTIAL opcode, but with two caveats:
> > > > >  4. These commands supported only with ECC disabled.
> > > > >  5. Issuing a READ PAGE CACHE series (31h, 00h-31h, 3Fh) command
> > > > >   when the array is busy (RDY =3D 1, ARDY =3D 0) is supported if =
the previous
> > > > >   command was a READ PAGE (00h-30h) or READ PAGE CACHE series
> > > > >   command; otherwise, it is prohibited.
> > > > >
> > > > > As far as I understand, the second remark suits us, since we
> > > > > create the correct sequence.
> > > >
> > > > Exactly, we do:
> > > >
> > > >         READ0 (0), READSTART (30),
> > > >         READCACHESEQ (31), data,
> > > >         READCACHESEQ (31), data,
> > > >         ...
> > > >         READCACHEEND (3f), data.
> > > >
> > > > which is what the datasheet tells us I believe.
> > > >
> > > > > But the first remark can be a problem in this case.
> > > >
> > > > I was not aware of this limitation, it's only written in the
> > > > summary, not in the details about the commands, nice finding. We
> > > > need to prevent on-die ECC users from enabling this feature.
> > > >
> > > > But given the below trace, you're not using the on-die ECC engine,
> > > > right? It looks like you're using the controller's ELM engine to
> > > > perform ECC correction, so I don't see why this specific limitation
> > > > would hit us. Can you confirm the ECC engine of the chip is disable=
d?
> > >
> > > Yes, on-die ECC is disabled.
> > > Please advise where I can insert some debug messages to clear things =
up.
> > >
> > > > > > > omap-gpmc 50000000.gpmc: GPMC revision 6.0 ...
> > > > > > > nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xda
> > > > > > > nand: Micron MT29F2G08ABAEAWP
> > > > > > > nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB
> > > > > > > size: 64
> > > > > > > nand: using OMAP_ECC_BCH8_CODE_HW ECC scheme ...
> > > > > > > VFS: Mounted root (squashfs filesystem) readonly on device 25=
4:0.
> > > > > > > devtmpfs: mounted
> > > > > > > Freeing unused kernel image (initmem) memory: 1024K Run
> > > > > > > /sbin/init as init process SQUASHFS error: lzo decompression
> > > > > > > failed, data probably corrupt SQUASHFS error: Failed to read
> > > > > > > block 0xd291c2: -5 SQUASHFS error: lzo decompression failed,
> > > > > > > data probably corrupt SQUASHFS error: Failed to read block
> > > > > > > 0xd291c2: -5 SQUASHFS error: Unable to read data cache entry
> > > > > > > [d291c2] SQUASHFS error: Unable to read page, block d291c2,
> > > > > > > size 14307 SQUASHFS error: Unable to read data cache entry
> > > > > > > [d291c2] SQUASHFS error: Unable to read page, block d291c2,
> > > > > > > size 14307 Kernel panic - not syncing: Attempted to kill init=
!
> > > > > > > exitcode=3D0x00000007 CPU: 0 PID: 1 Comm: init Not tainted
> > > > > > > 6.3.0+ #105 Hardware name: Generic AM33XX (Flattened Device
> > > > > > > Tree)  unwind_backtrace from show_stack+0xb/0xc  show_stack
> > > > > > > from dump_stack_lvl+0x2b/0x34  dump_stack_lvl from
> > > > > > > panic+0xbd/0x230  panic from make_task_dead+0x1/0x120
> > > > > > > make_task_dead from 0xc102ca80 ---[ end Kernel panic - not
> > > > > > > syncing: Attempted to kill init!
> > > > > > > exitcode=3D0x00000007 ]---

--000000000000caeb8605fcf99305
Content-Type: image/png; name="F0000TEK.png"
Content-Disposition: attachment; filename="F0000TEK.png"
Content-Transfer-Encoding: base64
Content-ID: <f_libh8qzj0>
X-Attachment-Id: f_libh8qzj0

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
--000000000000caeb8605fcf99305
Content-Type: image/png; name="F0001TEK.png"
Content-Disposition: attachment; filename="F0001TEK.png"
Content-Transfer-Encoding: base64
Content-ID: <f_libh8xmk1>
X-Attachment-Id: f_libh8xmk1

iVBORw0KGgoAAAANSUhEUgAAAUAAAADwCAMAAABG801ZAAABhGlDQ1BJQ0MgcHJvZmlsZQAAKJF9
kT1Iw0AcxV9Ti0UqDnYQEZqhOtlFpTjWKhShQqgVWnUwufQLmrQkKS6OgmvBwY/FqoOLs64OroIg
+AHi6uKk6CIl/i8ptIjx4Lgf7+497t4BQqvKNLMvAWi6ZWRSSTGXXxX7XxFABEHEEZGZWZ+TpDQ8
x9c9fHy9i/Es73N/jkG1YDLAJxInWN2wiDeI45tWnfM+cZiVZZX4nHjSoAsSP3JdcfmNc8lhgWeG
jWxmnjhMLJZ6WOlhVjY04hniqKrplC/kXFY5b3HWqg3WuSd/YaigryxzneYYUljEEiSIUNBABVVY
iNGqk2IiQ/tJD/+o45fIpZCrAkaOBdSgQXb84H/wu1uzOD3lJoWSQODFtj/Ggf5doN207e9j226f
AP5n4Erv+mstYPaT9GZXix4BQ9vAxXVXU/aAyx1g5KkuG7Ij+WkKxSLwfkbflAeGb4GBNbe3zj5O
H4AsdZW+AQ4OgYkSZa97vDvY29u/Zzr9/QDdj3LR/+Gs5gAAAwBQTFRF//////+q//9V//8A//cA
/+8A/+cA/98A/9cA/88A/8cA/78A/7cA/68A/6cA/58A////7u7/3d3/zMz/u7v/qqr/mZn/iIj/
d3f/Zmb/VVX/RET/MzP/IiL/ERH/AAD//////+D//8H//6L//4P//2T//0X//yb//wD/9wD37wDv
5wDn3wDf1wDXzwDPwADA////4P/gwf/Bov+ig/+DZP9kRf9FJv8mAP8AAPcAAO8AAOcAAN8AANcA
AM8AAMAA/////+Dg/8HB/6Ki/4OD/2Rk/0VF/yYm/wAA9wAA7wAA5wAA3wAA1wAAzwAAwAAA////
7u7u3d3dzMzMu7u7qqqqmZmZiIiId3d3ZmZmVVVVREREMzMzIiIiERERAAAA////4P//wf//ov//
g///ZP//Rf//Jv//AP//APf3AO/vAOfnAN/fANfXAM/PAMDAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA/6UAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAQ0cFcAAAAAlwSFlzAAALEwAACxMBAJqcGAAAAAd0SU1FB+cFHwg3NLivTBoA
AApvSURBVHja7Z1ZuqMgEIV7B7W0i58LYAm1/7dOlKEYRTERzeF2a6LG4c+BqmII/yakrvRv0iat
792LjaSXv+b0907ude9Na7/M3a/ZtKz8YteZDRBtz6PFVh1c89+k/SFT+8X0LoJ/f57gn/3XAdBT
EXcuIGi78ot9Z9aepz1FsJQAI2jNCpzab+vvTxD8M1tWKf4d0WMCMHjuAsCmBwsBevYtAK1q2651
HOD0J3V4SIzalyABphpAvevMNgdrL0MPMMDjAAb/P6nAldhpAM39av+tFwDqXQC9AsUJtU7p5ADq
6bMAfTF4GGCQt6I82pWFRZk3OdvaVAZaU6x1kyHuKgM/AzDK1YkR2Q9wisqHDYDevJ5dBk5hDnYc
DxuR+BbCskeHlqW5XI/dGKtjLYoK7+JUy8D61UQJ3urMyAwc7ri/Iz0F/qFbNvnQeq9D/UyASOcA
nH818XwEQAageqWrFrrzBDwrtm9Z8Su9N6plsex4bViPe79fdr/emsPmkxT4YID8NYBXJd35+RWS
QyYBsgVoca4Axfr2AE2F2vkAndosQN4DkIhei8n/3zYi+Zsrkj1tR4Vf46kEwLkEcM4DnAsAV2xm
STR2Fu7U3wJmpSIUyH0KJIGxTYH3LQPZpAAgFwHyHoC0qm88gHzmuVgiTACuq2WXA8gOJI+lQG7F
82mAnAfIHwRojQgXi2veLuB53cG1kt/mJrG9ZMDajAiLZI1ICnDeD5AOKdAUF5aXXzLzpni8Ak1J
bt97YOwB8jlKDACepcDdbkx0bXmtprTr4OTDZwLkcwDudaT50vQ9gOnX/jWA6iRWDwU4C12LOHxx
7Z0PZYsttj6/LMPc29mXfWFROq9lofTNlrfnGpHku7JGhD8LUNoBztoH3vZN+AqvsKJAlgrcBZDK
8dtBP5A/SGJEgLeqzroMINcBLp4MWZ8GAHcBNG4gGX+aBq7OUtcZkS0FmrKwCeBDFMinZuFoDYCH
AEKBPQB/zoicBbDNrYmNyEXNmqsROXyCNwTOLdT6yrYLl447CeAzFMifUuAEgAB4FCD3AKxHxAC4
BZDqUfHzIhGeSwDno1mYoMCuMhBZuLMMhBHpVCAAfkuBMCLIwsjCAAiAANgxTuS3jcgp40SgQGRh
AATAhwC80TiRISORW40TGVGB9xonMi7AYceJQIEA+DsN63ykYf34OBEo8KAbA4BwpAEQ1VnPaxOB
Ao8okFpHOgBgASBtdisCwCaA4gUB4J4sbP9sX+lCLy0YkQ2AZNXXABAKjHsFkhjrAIBHARIA9rgx
bpAIACISQSSCygQABMBWgESTH7FOVKxUBcCaGxMGIohEjjSsRysocF8WDhpFUJlwVIEiFwMgAH7R
iJAE+NMj1g80rNsfjaGpHSAUCEcaAAFwZICM6qy+SIQxTmRsBT4cIAPgUYAKAC8BiHEiUQE484FY
+MfHiXCHAtFLv/kHxDFOZINUF8CfUuDFAIczIrzXiKiiEeE+I3JHBfKOaXE+osBmN4Z5BIA8HsBG
R/qFb/13OUA3B5fdwmJ2AzvLjpIH2HklLgU4rQD5aoAfm6nk8wB5nYzlWiNSfLgdO9SpRqQZ4FIE
Xq9AJScSUBUVVSJfVQ1D1C6A5GyIb10qlYHTGGVgaDvYL+JpXjh59QmAJgheW+gqPwX/PsOIVvhA
ERrO0BcCVN0A2/zAqxbcd4J0Jgw3A9rsAM5HAAajRR7bsL7SUWp2FNdGdAdQNLG3jli3ZSBV+rY9
TIEG4C4FzpsKlFOKPLYywQJUKgW4blKFMlA1AqQfAKgSgKoIkALPpw5wy415OkAyACkGaGdPJTSs
v+nQmxG91mp+LYjeYGjZ8SZHr30808pu2W94vo+js1vlXlcvJjIHUG5z9GGy2+KjVfL5DQVStHYX
ojS9UWW35tN7x0kA6xfakdT2bWc+lKH23kpfSGcCvCzF9Hq/u16A1miQ72y51Uu/cldGD+EDR4eQ
P0SldMjm/NIT1wA6KSr3GaXMZ9xJWQWnV8ELDj+9nYUtMpIDhxvGiVBS0rz+yuU4lQt4cqUWxSU/
bRuRlVDZiFC4g1YjYs7Fiy3x3wrZOXjfdoNWk6MWM7NcZqaNRiWapvHHiVD1bbsb471qzlVXWGeH
TIfLhS1vZGHbMDx0L/1TASpWGwBZAlTbCqTnAwxcomaADIDZ6sQiQN9EJd+Wx4nIoTa3mh6Xdp5K
ApwLAJdPcFSTvV67PE7ET645eGVCpwKLdf4bMXdRgbfrYEmJF/PFOowHAlQA+IsAxzEi9M2LOyNy
63EiFylQIQsDIAA+FuDSZYNd77U7NazTNy+ej0QsOrdkKHCnAllgnADwMEDb+QoA+xTIMCJdABmR
yHYkUjciUGCPG+N6oQIgHGkAHAwgoTqrawdRyYhAgU3XpaICy4YDACU/Kv0eAkOBnQo0I7jWmpiS
HH/eiFSz8OTGshaDEUQiVItE7EDMNoDwA/MAp1o4DIAtAKHAHoAwIieFcjAiO6uz9gOEAhHKAeAQ
AH07MFsjUmwaAcAUoPebvQfTBBAN60Z/WYDsa/ehwKoCywBNBRcAVgHKwEMA5EILJwAmAJkBsNsK
s8jJcRmISGQzEmHnugg3BkYEjjQAAiAAojqrYkQwTgRZGAABEAA7x4kgEnnCOBHCOJFOgGoggHcc
JzIUwDuOExkQ4L3GidBXL/7AcSJjKPDG40QGAXhfRxoAfxTgMA3rpEYYsQ4F9iiQW0c6AGABoOua
CoB9AMULBsA9WZhlJ5lyhQwikbwRYdGhaFVfA0AoMOpiZGM4blQgAGYBMgD2uDFukAgAficSgRE5
AJCgwB6AbgpxAOxR4IsiACahiF8V20X+uQkLCAATN8atNgEuCrzaiJByM7uMYEQ4cAc3AV5dBm5M
sHRBGcgZf3pgKzwcwDiIqwCcxgKohgDIYtQN8w0AXmQ/qqGcrM2614j1AaqzbPgbdTEaVoGXpic0
Kj0G4G8uAHAMgL+bzhkngnRQgRTMAOZ3mYnptqY3rXRnL/zyRSZpsVxW2mzRJz1n5iGDH16k9qdN
6gMnPwedOCe5ydSoPr1psTu771sc/fJFDqCHpt8rbTA6qL38sg9Jcj81Pm0WYFmBrQCz3dkPAbTY
BECzQfcBzDwkJYyPAyRXM10AWJpcstKdvTEeXxCtfxWAuleBmYfMApxqk7l2KHATYBrxnAtQT6cr
MH7V8rSfBsjTMYCivPteFo61eBggFQCSPGXxjMXu7EmzfrG7WBagTjmeYUQyroYVS8vT7nJjSBj2
yilL3dmjX76oA0zdGKu6Nfv2eTTFhzSP9l43Pm0xEhk16aHvDpEIAAIgAAIg0u0BmoqErFtTjpqT
iptNX2d3bctNAJpgTecxJQcatknFTb32hpw3SI8DOEWxhgOo0yhERz63q2moVziI6rlc9d3jsrAO
sYQAgyxspacnqeEsPgEwrX16iAL1O3mAJpe6HZmob9KCekGEFMWnovLqoVk4KNRk3tTJKpBtKRcn
CnwYQF0FGPOLK27ckTUjki0Dn+/GyGxrDG9UBpos3+DGUOLGPMiI3LZC5h/4IZQDwDun//gqBnjw
o20DAAAAAElFTkSuQmCC
--000000000000caeb8605fcf99305
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--000000000000caeb8605fcf99305--

