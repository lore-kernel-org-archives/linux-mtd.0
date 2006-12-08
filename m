Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GsfoB-0004ZV-4c
	for linux-mtd@lists.infradead.org; Fri, 08 Dec 2006 08:30:40 -0500
Subject: Re: Eraseblocks torture: OneNAND results
From: Artem Bityutskiy <dedekind@infradead.org>
To: kyungmin.park@samsung.com
In-Reply-To: <1165565328.20337.115.camel@sauron>
References: <6640129.409201165563759259.JavaMail.weblogic@ep_ml20>
	<1165565328.20337.115.camel@sauron>
Content-Type: multipart/mixed; boundary="=-oIjIm/pUCa4nu6+zriWv"
Date: Fri, 08 Dec 2006 15:30:19 +0200
Message-Id: <1165584619.3975.9.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-oIjIm/pUCa4nu6+zriWv
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Kyungmin,

On Fri, 2006-12-08 at 10:08 +0200, Artem Bityutskiy wrote:
> Ah, indeed, thanks. I will add bad block checking. Also, I am
> re-structuring the test now to make it baster and more torturous. I am
> going to do erase/write/operations with the whole group, not with each
> eraseblock separately. HW guys think it should cause more trouble for
> flash. I will notify you when to update.

I have re-worked the test and made it aware of bad eraseblock. The
updated version is at git.

I also got one more error, the log is attached. I do not know how it
happens that we write 0xAA but read 0x55. But what I can say is that the
first errors we saw were one-bit errors. Now we mostly get massive
corruptions. This looks strange. May be we should leave these (20-51)
eraseblocks alone and start torturing new set of eraseblocks.

Anyways, I hope you will run the test and see what you have on your
system.

I have attach one more failure log. The symptoms look the same. But now
we verify eraseblocks after erase, so we can be sure erase does not
leave garbage in eraseblocks.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)

--=-oIjIm/pUCa4nu6+zriWv
Content-Disposition: attachment; filename=2nd_g_torture_01.txt
Content-Type: text/plain; name=2nd_g_torture_01.txt; charset=utf-8
Content-Transfer-Encoding: 7bit

insmod torture.ko dev=4
[12016.978698] 
[12016.980529] =========================================================================================
[12016.990051] EB torture: Torture 32 eraseblocks (20-52) of mtd4
[12016.996093] EB torture: Write verify enabled
[13670.757598] - 00001000 erase cycles done
[15319.406188] - 00002000 erase cycles done
[15416.399993] EB torture: read wrong data from EB 43 after
[15416.412719] EB torture: Verify fails on 1 pages, 2016 bytes/16128 bits
[15416.419525] EB torture: The following is a list of all differences between what was read from flash and what was expected
[15416.431579] -----------------------------------------------------------------------------------------
[15416.441101] EB torture: Page 0 has 2016 bytes/16128 bits failing verify, starting at offset 0x0
[15416.450225] Offset       Read                          Written
[15416.456115] 0x00000000:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.463745] 0x00000008:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.471374] 0x00000010:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.479003] 0x00000018:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.486633] 0x00000020:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.494262] 0x00000028:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.501892] 0x00000030:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.509521] 0x00000038:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.517150] 0x00000040:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.524780] 0x00000048:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.532409] 0x00000050:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.540039] 0x00000058:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.547668] 0x00000060:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.555297] 0x00000068:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.562927] 0x00000070:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.570556] 0x00000078:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.578186] 0x00000080:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.585845] 0x00000088:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.593475] 0x00000090:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.601104] 0x00000098:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.608734] 0x000000a0:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.616363] 0x000000a8:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.623992] 0x000000b0:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.631622] 0x000000b8:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.639251] 0x000000c0:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.646881] 0x000000c8:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.654510] 0x000000d0:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.662170] 0x000000d8:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.669799] 0x000000e0:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.677429] 0x000000e8:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.685058] 0x000000f0:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.692687] 0x000000f8:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.700317] 0x00000100:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.707946] 0x00000108:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.715576] 0x00000110:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.723205] 0x00000118:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.730834] 0x00000120:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.738464] 0x00000128:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.746093] 0x00000130:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.753540] 0x00000138:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.761169] 0x00000140:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.768798] 0x00000148:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.776428] 0x00000150:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.784057] 0x00000158:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.791687] 0x00000160:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.799316] 0x00000168:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.806945] 0x00000170:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.814575] 0x00000178:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.822204] 0x00000180:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.829833] 0x00000188:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.837463] 0x00000190:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.845092] 0x00000198:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.852722] 0x000001a0:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.860351] 0x000001a8:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.867980] 0x000001b0:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.875610] 0x000001b8:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.883239] 0x000001c0:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.890869] 0x000001c8:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.898498] 0x000001d0:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.906158] 0x000001d8:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.913787] 0x000001e0:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.921417] 0x000001e8:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.929046] 0x000001f0:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.936676] 0x000001f8:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.944305] 0x00000200:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.951934] 0x00000208:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.959564] 0x00000210:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.967193] 0x00000218:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.974853] 0x00000220:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.982482] 0x00000228:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.990112] 0x00000230:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15416.997741] 0x00000238:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.005371] 0x00000240:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.013000] 0x00000248:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.020629] 0x00000250:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.028259] 0x00000258:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.035888] 0x00000260:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.043518] 0x00000268:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.051147] 0x00000270:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.058776] 0x00000278:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.066406] 0x00000280:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.073852] 0x00000288:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.081481] 0x00000290:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.089111] 0x00000298:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.096740] 0x000002a0:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.104370] 0x000002a8:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.111999] 0x000002b0:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.119628] 0x000002b8:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.127258] 0x000002c0:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.134887] 0x000002c8:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.142517] 0x000002d0:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.150146] 0x000002d8:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.157775] 0x000002e0:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.165405] 0x000002e8:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.173034] 0x000002f0:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.180664] 0x000002f8:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.188293] 0x00000300:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.195922] 0x00000308:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.203552] 0x00000310:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.211181] 0x00000318:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.218811] 0x00000320:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.226470] 0x00000328:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.234100] 0x00000330:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.241729] 0x00000338:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.249359] 0x00000340:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.256988] 0x00000348:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.264617] 0x00000350:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.272247] 0x00000358:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.279876] 0x00000360:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.287506] 0x00000368:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.295135] 0x00000370:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.302795] 0x00000378:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.310424] 0x00000380:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.318054] 0x00000388:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.325683] 0x00000390:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.333312] 0x00000398:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.340942] 0x000003a0:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.348571] 0x000003a8:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.356201] 0x000003b0:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.363830] 0x000003b8:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.371459] 0x000003c0:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.379089] 0x000003c8:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.386718] 0x000003d0:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.394165] 0x000003d8:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.401794] 0x000003e0:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.409423] 0x000003e8:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.417053] 0x000003f0:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.424682] 0x000003f8:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.432312] 0x00000400:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.439941] 0x00000408:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.447570] 0x00000410:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.455200] 0x00000418:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.462829] 0x00000420:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.470458] 0x00000428:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.478088] 0x00000430:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.485717] 0x00000438:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.493347] 0x00000440:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.500976] 0x00000448:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.508605] 0x00000450:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.516235] 0x00000458:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.523864] 0x00000460:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.531494] 0x00000468:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.539123] 0x00000470:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.546752] 0x00000478:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.554412] 0x00000480:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.562042] 0x00000488:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.569671] 0x00000490:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.577301] 0x00000498:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.584930] 0x000004a0:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.592559] 0x000004a8:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.600189] 0x000004b0:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.607818] 0x000004b8:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.615447] 0x000004c0:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.623107] 0x000004c8:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.630737] 0x000004d0:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.638366] 0x000004d8:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.645996] 0x000004e0:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.653625] 0x000004e8:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.661254] 0x000004f0:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.668884] 0x000004f8:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.676513] 0x00000500:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.684143] 0x00000508:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.691772] 0x00000510:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.699401] 0x00000518:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.707031] 0x00000520:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.714477] 0x00000528:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.722106] 0x00000530:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.729736] 0x00000538:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.737365] 0x00000540:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.744995] 0x00000548:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.752624] 0x00000550:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.760253] 0x00000558:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.767883] 0x00000560:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.775512] 0x00000568:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.783142] 0x00000570:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.790771] 0x00000578:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.798400] 0x00000580:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.806030] 0x00000588:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.813659] 0x00000590:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.821289] 0x00000598:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.828918] 0x000005a0:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.836547] 0x000005a8:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.844177] 0x000005b0:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.851806] 0x000005b8:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.859436] 0x000005c0:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.867065] 0x000005c8:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.874725] 0x000005d0:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.882354] 0x000005d8:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.889984] 0x000005e0:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.897613] 0x000005e8:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.905242] 0x000005f0:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.912872] 0x000005f8:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.920501] 0x00000600:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.928131] 0x00000608:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.935760] 0x00000610:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.943420] 0x00000618:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.951049] 0x00000620:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.958679] 0x00000628:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.966308] 0x00000630:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.973937] 0x00000638:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.981567] 0x00000640:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.989196] 0x00000648:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15417.996826] 0x00000650:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.004455] 0x00000658:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.012084] 0x00000660:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.019714] 0x00000668:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.027343] 0x00000670:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.034790] 0x00000678:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.042419] 0x00000680:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.050048] 0x00000688:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.057678] 0x00000690:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.065307] 0x00000698:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.072937] 0x000006a0:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.080566] 0x000006a8:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.088195] 0x000006b0:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.095825] 0x000006b8:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.103454] 0x000006c0:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.111083] 0x000006c8:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.118713] 0x000006d0:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.126342] 0x000006d8:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.133972] 0x000006e0:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.141601] 0x000006e8:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.149230] 0x000006f0:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.156860] 0x000006f8:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.164489] 0x00000700:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.172119] 0x00000708:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.179748] 0x00000710:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.187377] 0x00000718:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.195037] 0x00000720:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.202667] 0x00000728:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.210296] 0x00000730:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.217926] 0x00000738:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.225555] 0x00000740:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.233184] 0x00000748:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.240814] 0x00000750:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.248443] 0x00000758:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.256072] 0x00000760:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.263732] 0x00000768:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.271362] 0x00000770:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.278991] 0x00000778:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.286621] 0x00000780:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.294250] 0x00000788:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.301879] 0x00000790:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.309509] 0x00000798:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.317138] 0x000007a0:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.324768] 0x000007a8:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.332397] 0x000007b0:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.340026] 0x000007b8:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.347656] 0x000007c0:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.355102] 0x000007c8:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.362731] 0x000007d0:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.370361] 0x000007d8:  55 55 55 55 55 55 55 55  ***  aa aa aa aa aa aa aa aa
[15418.377990] 0x000007e0:  aa aa aa aa aa aa aa aa       aa aa aa aa aa aa aa aa
[15418.391937] EB torture: verify failed for 0xAA55AA... pattern
[15418.397949] EB torture: torture finished after 2058 erase cycles
[15418.404235] EB torture: error -22 occurred during torturing
[15418.409851] =========================================================================================

--=-oIjIm/pUCa4nu6+zriWv--
