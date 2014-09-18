Received: from mail-qc0-f171.google.com ([209.85.216.171])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XUWZd-0002LN-54
 for linux-mtd@lists.infradead.org; Thu, 18 Sep 2014 07:56:18 +0000
Received: by mail-qc0-f171.google.com with SMTP id x3so711564qcv.30
 for <linux-mtd@lists.infradead.org>; Thu, 18 Sep 2014 00:55:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20140918060336.GE7362@norris-Latitude-E6410>
References: <1410447730-16087-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1410447730-16087-3-git-send-email-ezequiel@vanguardiasur.com.ar>
 <20140918060336.GE7362@norris-Latitude-E6410>
Date: Thu, 18 Sep 2014 08:48:06 +0100
Message-ID: <CAAEAJfAbObn0biRrxKeGpddvYcSZfabntz8fY3LCaa8wsEzjkg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] nand: omap2: Remove horrible ifdefs to fix module
 probe
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Tony Lindgren <tony@atomide.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Roger Quadros <rogerq@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 18 September 2014 07:03, Brian Norris <computersforpeace@gmail.com> wrot=
e:
> On Thu, Sep 11, 2014 at 12:02:09PM -0300, Ezequiel Garcia wrote:
>> The current code abuses ifdefs to determine if the selected ECC scheme
>> is supported by the running kernel. As a result the code is hard to read=
,
>> and it also fails to load as a module.
>
> Yes, a real eyesore, with little benefit from the #ifdef's.
>
>> This commit removes all the ifdefs and instead introduces a function
>> omap2_nand_ecc_check() to check if the ECC is supported by using
>> IS_ENABLED(CONFIG_xxx).
>>
>> Since IS_ENABLED() is true when a config is =3Dy or =3Dm, this change fi=
xes the
>> module so it can be loaded with no issues.
>>
>> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> [...]
>> diff --git a/include/linux/platform_data/elm.h b/include/linux/platform_=
data/elm.h
>> index 780d1e9..25d1bca 100644
>> --- a/include/linux/platform_data/elm.h
>> +++ b/include/linux/platform_data/elm.h
>> @@ -42,8 +42,22 @@ struct elm_errorvec {
>>       int error_loc[16];
>>  };
>>
>> +#if IS_ENABLED(CONFIG_MTD_NAND_OMAP_BCH)
>>  void elm_decode_bch_error_page(struct device *dev, u8 *ecc_calc,
>>               struct elm_errorvec *err_vec);
>>  int elm_config(struct device *dev, enum bch_ecc bch_type,
>>       int ecc_steps, int ecc_step_size, int ecc_syndrome_size);
>> +#else
>> +void elm_decode_bch_error_page(struct device *dev, u8 *ecc_calc,
>> +             struct elm_errorvec *err_vec)
>
> You should not be defining non-static functions in a header. Now these
> functions will be uselessly placed in every compilation unit that
> includes this header. You should probably make this function 'static
> inline'.
>

Darn, of course they must be static! Thanks for spotting this.
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
