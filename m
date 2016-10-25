Received: from s159.web-hosting.com ([68.65.120.118])
 by merlin.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bz7tw-000736-S4
 for linux-mtd@lists.infradead.org; Tue, 25 Oct 2016 20:00:50 +0000
Received: from mail-lf0-f47.google.com ([209.85.215.47]:33279)
 by server159.web-hosting.com with esmtpsa (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.86_1) (envelope-from <jagan@openedev.com>)
 id 1bz7t4-002Ppt-P5
 for linux-mtd@lists.infradead.org; Tue, 25 Oct 2016 16:00:00 -0400
Received: by mail-lf0-f47.google.com with SMTP id x79so225667684lff.0
 for <linux-mtd@lists.infradead.org>; Tue, 25 Oct 2016 12:59:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAD6G_RRJUsdPBbbsP_AieAZjRykHN=bk-+RJ7pUuuHWJrgBd8A@mail.gmail.com>
References: <cover.1475668319.git.cyrille.pitchen@atmel.com>
 <CAD6G_RR4Av8+szo9v2oucCFvwnow86gMVC-Ku_-Qfy18TVMGgA@mail.gmail.com>
 <c022e6fc-6bd7-d124-7233-e1e742049657@denx.de>
 <CAD6G_RQ2BjtF2cmPUJvYNk7KZZ6eTVAQsEqWs26xn710A4Dz-w@mail.gmail.com>
 <558d668a-69b0-8066-b7da-090517d3161d@atmel.com>
 <1181d557-c149-8dfd-7fd1-bc83056541cf@atmel.com>
 <CAD6G_RRJUsdPBbbsP_AieAZjRykHN=bk-+RJ7pUuuHWJrgBd8A@mail.gmail.com>
From: Jagan Teki <jagan@openedev.com>
Date: Wed, 26 Oct 2016 01:29:52 +0530
Message-ID: <CAD6G_RQc8JJefBP4=i721zTWShKrojKX2HWSJ+6EsgadL-Srww@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] mtd: spi-nor: parse SFDP tables to setup (Q)SPI
 memories
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: Marek Vasut <marex@denx.de>, Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 nicolas.ferre@atmel.com, boris.brezillon@free-electrons.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

Hi Cyrille,

On Tue, Oct 25, 2016 at 2:38 PM, Jagan Teki <jagan@openedev.com> wrote:
> On Mon, Oct 24, 2016 at 7:37 PM, Cyrille Pitchen
> <cyrille.pitchen@atmel.com> wrote:
>> Le 24/10/2016 =C3=A0 14:09, Cyrille Pitchen a =C3=A9crit :
>>> Hi Jagan,
>>>
>>> Le 24/10/2016 =C3=A0 09:41, Jagan Teki a =C3=A9crit :
>>>> On Sun, Oct 23, 2016 at 2:03 AM, Marek Vasut <marex@denx.de> wrote:
>>>>> On 10/22/2016 01:00 PM, Jagan Teki wrote:
>>>>>> On Wed, Oct 5, 2016 at 5:30 PM, Cyrille Pitchen
>>>>>> <cyrille.pitchen@atmel.com> wrote:
>>>>>>> Hi all,
>>>>>>>
>>>>>>> This series extends support of SPI protocols to new protocols such =
as
>>>>>>> SPI x-2-2 and SPI x-4-4. Also spi_nor_scan() tries now to select th=
e right
>>>>>>> op codes, timing parameters (number of mode and dummy cycles) and e=
rase
>>>>>>> sector size by parsing the Serial Flash Discoverable Parameter (SFD=
P)
>>>>>>> tables, when available, as defined in the JEDEC JESD216 specificati=
ons.
>>>>>>>
>>>>>>> When SFDP tables are not available, legacy settings are still used =
for
>>>>>>> backward compatibility (SPI and earlier QSPI memories).
>>>>>>>
>>>>>>> Support of SPI memories >128Mbits is also improved by using the 4by=
te
>>>>>>> address instruction set, when available. Using those dedicated op c=
odes
>>>>>>> is stateless as opposed to enter the 4byte address mode, hence a be=
tter
>>>>>>> compatibility with some boot loaders which expect to use 3byte addr=
ess
>>>>>>> op codes.
>>>>>>
>>>>>> The memories which are > 128Mbits should have 4-bytes addressing
>>>>>> support based on my experience, do you think BAR is also required
>>>>>> atleast from spi-nor side?
>>>>>
>>>>> Yes, I believe BAR is still required for broken/dumb flash chips.
>>>>> Not all chips > 16 MiB support dedicated 4-byte addressing opcodes :-=
(
>>>>
>>>> Do you have list for those broken chips? because I never find any
>>>> chips which has > 16 MiB with not support of 4-byte address opcodes
>>>> and I've seen the controller has dependable with BAR though it can
>>>> access > 16MiB ex: zynq qspi/
>>>>
>>>> thanks!
>>>>
>>>
>>> Let's take the case of Micron n25q256* memories. Depending of the part =
number,
>>> the 12h op code is associated with either 4-byte address Page Program 1=
-1-1
>>> or 3-byte address Page Program 1-4-4.
>>> Then considering parts where the 12h op code is used for 3-byte address=
 Page
>>> Program 1-4-4, there is no op code for a 4-byte address Page Program 1-=
1-1.
>>>
>>> Note 15, extracted from the Micron n25q_256mb_3v_65nm.pdf datasheet, ab=
out
>>> the 3-byte address Page Program 1-4-4 (Extended Quad Input Fast Program=
):
>>> The code 38h is valid only for part numbers N25Q256A83ESF40x, N25Q256A8=
3E1240x
>>> and N25Q256A83ESFA0F; the code 12h is valid for the other part numbers.

I am trying to understand the conflict more clearly with an example of
Micron, so on Table 18 from Micron n25q_256mb_3v_65nm.pdf datasheet,
Page program 3-byte has 02h and Quad page program 3-byte has 32h but
for 4-byte addressing only quad page program (no support of page
program) can be either 02h/32h/12h and indeed these can change based
on the n25q256* parts so why can't we rely on Quad page program for
4-byte addressing? and so there is no necessity for BAR here.

And also other than the un-supported-controller can't we rely directly
on supported page program opcodes for 4-byte addressing? say if it is
supporting QPP on 4-byte then use it as it is and no need to take care
of PP here.

thanks!
--=20
Jagan Teki
Free Software Engineer | www.openedev.com
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
