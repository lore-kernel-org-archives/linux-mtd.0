Received: from mail-yh0-f54.google.com ([209.85.213.54])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WhFdN-0004Uf-9B
 for linux-mtd@lists.infradead.org; Mon, 05 May 2014 09:56:30 +0000
Received: by mail-yh0-f54.google.com with SMTP id i57so348355yha.27
 for <linux-mtd@lists.infradead.org>; Mon, 05 May 2014 02:56:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1399275304.15290.15.camel@sauron.fi.intel.com>
References: <1398690859-11494-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1398690859-11494-4-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1399275304.15290.15.camel@sauron.fi.intel.com>
Date: Mon, 5 May 2014 06:56:07 -0300
Message-ID: <CAAEAJfBHf_mhoeWKEJCP-iraeLC2FpEkFsCKqXBmZ8zS=F4qyg@mail.gmail.com>
Subject: Re: [PATCH 3/3] nandtest: Introduce multiple reads & check iterations
From: =?UTF-8?Q?Ezequiel_Garc=C3=ADa?= <ezequiel@vanguardiasur.com.ar>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: b32955@freescale.com, Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Pekon Gupta <pekon@ti.com>,
 =?UTF-8?Q?Guido_Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5 May 2014 04:35, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Mon, 2014-04-28 at 10:14 -0300, Ezequiel Garcia wrote:
>>                         }
>> -                       if (erase_and_write(test_ofs, wbuf, rbuf))
>> +                       if (erase_and_write(test_ofs, wbuf, rbuf,
>> nr_reads))
>>                                 continue;
>>                         if (keep_contents)
>> -                               erase_and_write(test_ofs, kbuf, rbuf);
>> +                               erase_and_write(test_ofs, kbuf, rbuf,
>> 1);
>
> I think it would make sense to make the default to be at least 2, or may
> be 4.
>
> If you added this improvement, let's make sure people have it on by
> default.
>

No problem. How about 4?

Any other ideas from the community? (Ccing more NAND driver maintainers).
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
