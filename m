Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aH9uO-00055S-QO
 for linux-mtd@lists.infradead.org; Thu, 07 Jan 2016 12:43:17 +0000
Received: by mail-wm0-x22c.google.com with SMTP id f206so95723425wmf.0
 for <linux-mtd@lists.infradead.org>; Thu, 07 Jan 2016 04:42:55 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20160107012036.GU109450@google.com>
References: <1451336091-8210-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <20160107012036.GU109450@google.com>
Date: Thu, 7 Jan 2016 09:42:54 -0300
Message-ID: <CAAEAJfBCRD4QmkyUpH3iqXVd4wbXT=8EbOhnCBoAEk1d8HWtgQ@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: spi-nor: wait until lock/unlock operations are
 ready
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Brian Norris <computersforpeace@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Stas Sergeev <stsp@list.ru>
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

On 6 January 2016 at 22:20, Brian Norris <computersforpeace@gmail.com> wrot=
e:
> On Mon, Dec 28, 2015 at 05:54:51PM -0300, Ezequiel Garcia wrote:
>> On Micron and Numonyx devices, the status register write command
>> (WRSR), raises a work-in-progress bit (WIP) on the status register.
>> The datasheets for these devices specify that while the status
>> register write is in progress, the status register WIP bit can still
>> be read to check the end of the operation.
>>
>> This commit adds a wait_till_ready call on lock/unlock operations,
>> only for these manufacturers. This is needed to prevent applications
>
> Edited the above sentence, since you're not doing this "only for these
> manufacturers"; you're doing it for all that support lock/unlock.

Just to make sure we are on the same page here, this commit only
changes stm_lock, stm_unlock. So the change currently affects devices that
match JEDEC_MFR(info) =3D=3D SNOR_MFR_MICRON.

--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
