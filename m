Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QIFVF-00056L-HJ
	for linux-mtd@lists.infradead.org; Fri, 06 May 2011 07:31:10 +0000
Received: by wwb39 with SMTP id 39so2322359wwb.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 06 May 2011 00:31:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1304621338.7222.55.camel@localhost>
References: <1304334638-2198-1-git-send-email-kishore.kadiyala@ti.com>
	<1304621338.7222.55.camel@localhost>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Fri, 6 May 2011 13:00:47 +0530
Message-ID: <BANLkTi=6wkqWA+kjWShiEyFiVs0ZXqY6iw@mail.gmail.com>
Subject: Re: [PATCH] omap : nand : fix subpage ecc issue with prefetch
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: bdefaria@adeneo-embedded.com, linux-mtd@lists.infradead.org,
	linux-omap@vger.kernel.org, Kishore Kadiyala <kishore.kadiyala@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 6, 2011 at 12:18 AM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> On Mon, 2011-05-02 at 16:40 +0530, Kishore Kadiyala wrote:
>> For prefetch engine, read and write =A0got broken in commit '2c01946c'.
>> We never hit a scenario of not getting 'gpmc_prefetch_enable'
>> call success.
>> When reading/writing a subpage with a non divisible by 4 ecc number
>> of bytes, the mis-aligned bytes gets handled first before enabling
>> the Prefetch engine, then it reads/writes rest of the bytes.
>>
>> Signed-off-by: Kishore Kadiyala <kishore.kadiyala@ti.com>
>> Signed-off-by: Vimal Singh <vimal.newwork@gmail.com>
>> Reported-by: Bryan DE FARIA <bdefaria@adeneo-embedded.com>
>
> This needs a better commit message with more explanation and analysis of
> the problem and how it was fixed.This commit message is not very
> understandable. And then it needs also:

How about a commit log like this:

When reading/writing a subpage (When HW ECC is not available/enable)
for number of bytes not aligned to 4, the mis-aligned bytes gets
handled first (by cpu copy mathod) before enabling the Prefetch
engin to/from 'p' (start of buffer 'buf').
Then it reads/writes rest of the bytes with the help of Prefetch
engine, if available, or again by cpu copy mathod. Currnetly,
reading/writing of rest of bytes, is not done correctly. Its trying to
read/write again to/from begining of buffer 'buf', overwriting the
mis-aligned bytes.

For prefetch engine read and write it got broken in commit '2c01946c'.
And we never hit the scenario of not getting 'gpmc_prefetch_enable'
call sucess. So, problem did not get caught up.

This patch fixes the issue.

> Cc: stable@kernel.org [2.6.36+]
>
> Right? And then we could send it upstream.

Yes, sure. I think kishore can take care of adding this in 'cc'
while posting next time.

--=20
Regards,
Vimal Singh
