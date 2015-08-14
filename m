Received: from mail-vk0-f46.google.com ([209.85.213.46])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZQHLH-0006QC-4W
 for linux-mtd@lists.infradead.org; Fri, 14 Aug 2015 15:56:28 +0000
Received: by vkbf67 with SMTP id f67so31106787vkb.3
 for <linux-mtd@lists.infradead.org>; Fri, 14 Aug 2015 08:56:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150813012328.GA104137@google.com>
References: <1438612286-16070-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1438612286-16070-2-git-send-email-ezequiel@vanguardiasur.com.ar>
 <20150813012328.GA104137@google.com>
Date: Fri, 14 Aug 2015 12:56:05 -0300
Message-ID: <CAAEAJfA2DTdBLkfnXROOb-v+=0ZOBX0rKe4_eKp+KsBHn69a6A@mail.gmail.com>
Subject: Re: [PATCH 1/2] nand: pxa3xx: Increase READ_ID buffer and make the
 size static
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Brian Norris <computersforpeace@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12 August 2015 at 22:23, Brian Norris <computersforpeace@gmail.com> wrot=
e:
> On Mon, Aug 03, 2015 at 11:31:25AM -0300, Ezequiel Garcia wrote:
>> The read ID count should be made as large as the maximum READ_ID size,
>> so there's no need to have dynamic size. This commit sets the hardware
>> maximum read ID count, which should be more than enough on all cases.
>> Also, we get rid of the read_id_bytes, and use a macro instead.
>>
>> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>> ---
>>  drivers/mtd/nand/pxa3xx_nand.c | 28 ++++++----------------------
>>  1 file changed, 6 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_na=
nd.c
>> index 1259cc5..0815f11 100644
>> --- a/drivers/mtd/nand/pxa3xx_nand.c
>> +++ b/drivers/mtd/nand/pxa3xx_nand.c
>> @@ -126,6 +126,8 @@
>>  #define EXT_CMD_TYPE_LAST_RW 1 /* Last naked read/write */
>>  #define EXT_CMD_TYPE_MONO    0 /* Monolithic read/write */
>>
>> +#define READ_ID_BYTES                7 /* Large enough to read 'JEDEC' =
*/
>> +
>
> For the future: nand_base likes to read 8 bytes of ID for
> regular ID decoding. But pxa3xx_nand doesn't use the standard ID code
> still, so that's not a problem yet.
>

And in any case, 7 bytes is the maximum count for READ_ID supported
by this controller :-)

--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
