Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GuUTR-0007lF-Tr
	for linux-mtd@lists.infradead.org; Wed, 13 Dec 2006 08:48:47 -0500
Subject: Re: Eraseblocks torture: OneNAND results
From: Artem Bityutskiy <dedekind@infradead.org>
To: kyungmin.park@samsung.com
In-Reply-To: <5054449.505281165825887228.JavaMail.weblogic@ep_ml03>
References: <5054449.505281165825887228.JavaMail.weblogic@ep_ml03>
Content-Type: text/plain; charset=utf-8
Date: Wed, 13 Dec 2006 15:46:33 +0200
Message-Id: <1166017593.18628.11.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

Kyungmin,

On Mon, 2006-12-11 at 08:31 +0000, Kyungmin Park wrote:
> I think I need the more time to make a block worn-out.

FYI: now I see that the tortured eraseblocks do not contain all 0xFFs
after erase which is strange - the driver must have returned an error.
But mtd->erase is totally silent about this. Most probably it is a bug
in the OneNAND driver.

May you please take a look at onenand_wait() from
drivers/mtd/onenand/onenand_base.c in mtd-2.6.git. I see the following
code there:

-----------------------------------------------------------------------
ctrl =3D this->read_word(this->base + ONENAND_REG_CTRL_STATUS);

if (ctrl & ONENAND_CTRL_ERROR) {
    /* It maybe occur at initial bad block */
    DEBUG(MTD_DEBUG_LEVEL0, "onenand_wait: controller error =3D 0x%04x\n",
ctrl);
    /* Clear other interrupt bits for preventing ECC error */
    interrupt &=3D ONENAND_INT_MASTER;
}

...

return 0;
-----------------------------------------------------------------------

AFAIU, this is exactly the place when we should catch erase errors. But
what we do - we only change local 'interrupt' variable and later return
0. So we do not report about errors. This looks suspiciously. May you
comment on this?

Thanks.

Below is the log of the torture test error when we read garbage instead
of 0xFFs just after erase.

[89707.861785] EB torture: read wrong data from EB 20 after
[89707.874450] EB torture: Verify fails on 1 pages, 2048 bytes/8192 bits
[89707.881195] EB torture: The following is a list of all differences betwe=
en what was read from flash and what was expected
[89707.893920] ------------------------------------------------------------=
-----------------------------
[89707.903442] EB torture: Page 7 has 2048 bytes/8192 bits failing verify, =
starting at offset 0x3800
[89707.912567] Offset       Read                          Written
[89707.918640] 0x00003800:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89707.926300] 0x00003808:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89707.933929] 0x00003810:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89707.941558] 0x00003818:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89707.949188] 0x00003820:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89707.956634] 0x00003828:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89707.964263] 0x00003830:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89707.971893] 0x00003838:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89707.979553] 0x00003840:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89707.987182] 0x00003848:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89707.994812] 0x00003850:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.002441] 0x00003858:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.010070] 0x00003860:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.017700] 0x00003868:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.025329] 0x00003870:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.032958] 0x00003878:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.040588] 0x00003880:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.048217] 0x00003888:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.055847] 0x00003890:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.063476] 0x00003898:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.071105] 0x000038a0:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.078735] 0x000038a8:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.086364] 0x000038b0:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.093994] 0x000038b8:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.101623] 0x000038c0:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.109252] 0x000038c8:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.116912] 0x000038d0:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.124542] 0x000038d8:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.132171] 0x000038e0:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.139801] 0x000038e8:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.147430] 0x000038f0:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.155059] 0x000038f8:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.162689] 0x00003900:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.170318] 0x00003908:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.177978] 0x00003910:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.185607] 0x00003918:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.193237] 0x00003920:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.200866] 0x00003928:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.208496] 0x00003930:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.216125] 0x00003938:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.223754] 0x00003940:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.231384] 0x00003948:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.239013] 0x00003950:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.246643] 0x00003958:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.254272] 0x00003960:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.261901] 0x00003968:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.269561] 0x00003970:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.277008] 0x00003978:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.284729] 0x00003980:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.292358] 0x00003988:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.299987] 0x00003990:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.307617] 0x00003998:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.315246] 0x000039a0:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.322875] 0x000039a8:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.330505] 0x000039b0:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.338134] 0x000039b8:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.345764] 0x000039c0:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.353393] 0x000039c8:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.361022] 0x000039d0:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.368652] 0x000039d8:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.376281] 0x000039e0:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.383911] 0x000039e8:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.391540] 0x000039f0:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.399169] 0x000039f8:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.406799] 0x00003a00:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.414428] 0x00003a08:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.422058] 0x00003a10:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.429687] 0x00003a18:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.437347] 0x00003a20:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.444976] 0x00003a28:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.452606] 0x00003a30:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.460235] 0x00003a38:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.467864] 0x00003a40:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.475494] 0x00003a48:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.483123] 0x00003a50:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.490753] 0x00003a58:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.498382] 0x00003a60:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.506011] 0x00003a68:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.513671] 0x00003a70:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.521301] 0x00003a78:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.528930] 0x00003a80:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.536560] 0x00003a88:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.544189] 0x00003a90:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.551818] 0x00003a98:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.559448] 0x00003aa0:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.567077] 0x00003aa8:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.574707] 0x00003ab0:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.582336] 0x00003ab8:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.590026] 0x00003ac0:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.597656] 0x00003ac8:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.605102] 0x00003ad0:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.612731] 0x00003ad8:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.620361] 0x00003ae0:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.627990] 0x00003ae8:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.635620] 0x00003af0:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.643249] 0x00003af8:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.650878] 0x00003b00:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.658508] 0x00003b08:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.666137] 0x00003b10:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.673767] 0x00003b18:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.681396] 0x00003b20:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.689025] 0x00003b28:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.696655] 0x00003b30:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.704650] 0x00003b38:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.712310] 0x00003b40:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.719970] 0x00003b48:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.727630] 0x00003b50:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.735260] 0x00003b58:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.742889] 0x00003b60:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.750518] 0x00003b68:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.758148] 0x00003b70:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.765777] 0x00003b78:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.773437] 0x00003b80:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.781066] 0x00003b88:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.788696] 0x00003b90:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.796325] 0x00003b98:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.803955] 0x00003ba0:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.811584] 0x00003ba8:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.819213] 0x00003bb0:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.826843] 0x00003bb8:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.834472] 0x00003bc0:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.842102] 0x00003bc8:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.849731] 0x00003bd0:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.857391] 0x00003bd8:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.865020] 0x00003be0:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.872650] 0x00003be8:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.880279] 0x00003bf0:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.887908] 0x00003bf8:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.895538] 0x00003c00:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.903167] 0x00003c08:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.910797] 0x00003c10:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.918426] 0x00003c18:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.926055] 0x00003c20:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.933685] 0x00003c28:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.941131] 0x00003c30:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.948760] 0x00003c38:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.956390] 0x00003c40:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.964019] 0x00003c48:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.971649] 0x00003c50:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.979278] 0x00003c58:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.986907] 0x00003c60:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89708.994537] 0x00003c68:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.002166] 0x00003c70:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.009796] 0x00003c78:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.017425] 0x00003c80:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.025054] 0x00003c88:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.032684] 0x00003c90:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.040313] 0x00003c98:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.047943] 0x00003ca0:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.055572] 0x00003ca8:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.063201] 0x00003cb0:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.070831] 0x00003cb8:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.078491] 0x00003cc0:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.086090] 0x00003cc8:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.093750] 0x00003cd0:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.101379] 0x00003cd8:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.109008] 0x00003ce0:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.116638] 0x00003ce8:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.124267] 0x00003cf0:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.131896] 0x00003cf8:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.139526] 0x00003d00:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.147155] 0x00003d08:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.154785] 0x00003d10:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.162414] 0x00003d18:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.170043] 0x00003d20:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.177703] 0x00003d28:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.185333] 0x00003d30:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.192962] 0x00003d38:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.200592] 0x00003d40:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.208221] 0x00003d48:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.215850] 0x00003d50:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.223480] 0x00003d58:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.231109] 0x00003d60:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.238739] 0x00003d68:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.246368] 0x00003d70:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.253997] 0x00003d78:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.261444] 0x00003d80:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.269073] 0x00003d88:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.276733] 0x00003d90:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.284545] 0x00003d98:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.292205] 0x00003da0:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.299865] 0x00003da8:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.307525] 0x00003db0:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.315155] 0x00003db8:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.322784] 0x00003dc0:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.330413] 0x00003dc8:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.338043] 0x00003dd0:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.345672] 0x00003dd8:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.353302] 0x00003de0:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.360931] 0x00003de8:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.368560] 0x00003df0:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.376190] 0x00003df8:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.383819] 0x00003e00:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.391448] 0x00003e08:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.399078] 0x00003e10:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.406707] 0x00003e18:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.414337] 0x00003e20:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.421966] 0x00003e28:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.429626] 0x00003e30:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.437255] 0x00003e38:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.444885] 0x00003e40:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.452514] 0x00003e48:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.460144] 0x00003e50:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.467773] 0x00003e58:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.475433] 0x00003e60:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.483032] 0x00003e68:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.490661] 0x00003e70:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.498291] 0x00003e78:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.505920] 0x00003e80:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.513580] 0x00003e88:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.521209] 0x00003e90:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.528839] 0x00003e98:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.536468] 0x00003ea0:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.544097] 0x00003ea8:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.551727] 0x00003eb0:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.559356] 0x00003eb8:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.566986] 0x00003ec0:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.574615] 0x00003ec8:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.582244] 0x00003ed0:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.589874] 0x00003ed8:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.597320] 0x00003ee0:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.604949] 0x00003ee8:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.612579] 0x00003ef0:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.620208] 0x00003ef8:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.627838] 0x00003f00:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.635467] 0x00003f08:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.643096] 0x00003f10:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.650726] 0x00003f18:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.658355] 0x00003f20:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.665985] 0x00003f28:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.673614] 0x00003f30:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.681243] 0x00003f38:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.688873] 0x00003f40:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.696502] 0x00003f48:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.704132] 0x00003f50:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.711761] 0x00003f58:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.719390] 0x00003f60:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.727050] 0x00003f68:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.734710] 0x00003f70:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.742340] 0x00003f78:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.750000] 0x00003f80:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.757629] 0x00003f88:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.765258] 0x00003f90:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.772888] 0x00003f98:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.780548] 0x00003fa0:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.788208] 0x00003fa8:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.795837] 0x00003fb0:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.803466] 0x00003fb8:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.811096] 0x00003fc0:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.818725] 0x00003fc8:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.826354] 0x00003fd0:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.834014] 0x00003fd8:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.841644] 0x00003fe0:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.849273] 0x00003fe8:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.856903] 0x00003ff0:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.864532] 0x00003ff8:  aa aa aa aa aa aa aa aa  ***  ff ff ff ff ff ff=
 ff ff
[89709.872161] 0x00004000:  ff ff ff ff ff ff ff ff       ff ff ff ff ff ff=
 ff ff
[89709.885223] EB torture: verify failed for 0xFF... pattern
[89709.890899] EB torture: torture finished after 10796 erase cycles
[89709.897247] EB torture: error -22 occurred during torturing
[89709.903045] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
