Received: from mail-qg0-x234.google.com ([2607:f8b0:400d:c04::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XYL6d-0003yz-35
 for linux-mtd@lists.infradead.org; Sun, 28 Sep 2014 20:30:07 +0000
Received: by mail-qg0-f52.google.com with SMTP id z60so1411711qgd.11
 for <linux-mtd@lists.infradead.org>; Sun, 28 Sep 2014 13:29:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20140928002813.GP7362@norris-Latitude-E6410>
References: <1408220271-21455-1-git-send-email-zajec5@gmail.com>
 <1408267646-6643-1-git-send-email-zajec5@gmail.com>
 <20140928002813.GP7362@norris-Latitude-E6410>
Date: Sun, 28 Sep 2014 22:29:42 +0200
Message-ID: <CACna6rytk5vgzcFoOsWHRAXpEuieuUovUC-w6GprMxvmZsO=mg@mail.gmail.com>
Subject: Re: [PATCH V2] mtd: spi-nor: add Kconfig option to disable 4K sectors
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 28 September 2014 02:28, Brian Norris <computersforpeace@gmail.com> wrot=
e:
> On Sun, Aug 17, 2014 at 11:27:26AM +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
>> Current situation with 4K sectors is quite messy. First of all, some
>> MTD "users" don't work with such small size. An example may be UBIFS
>> which requires 15 KiB erase blocks as a minimum. In theory spi-nor
>> should provide multiple erase regions and MTD "users" should use the
>> one they need. Unforunately that is not implemented.
>>
>> In the result our flashes database in spi-nor is hackish. For some
>> flashes we pretend they don't support 4K sectors just because some
>> distribution uses UBIFS on it. This ofc leads to conflicts, like
>> Samsung using w25q128 with 4K sectors vs. OpenWrt requiring it to
>> pretend it's 64 KiB blocks only.
>>
>> My idea (plan?) for fixing this situation:
>> 1) Use real hw info (this requires a way for disabling 4K for now)
>> 2) Provide detailed info about erase regions
>> 3) Make UBIFS work with devices that support 4K sectors
>>
>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
>> ---
>> V2: Add extra info about performance in Kconfig. Thanks Kevin.
>>     Fix typo s/users/uses/ in commit message.
>
> Pushed to l2-mtd.git. Thanks!

Ooops, for some reason the whole diff is part of the commit message :|
http://git.infradead.org/l2-mtd.git/commitdiff/f83cd098095c0e2967e15914f3f9=
521bb122bc0a


> Now we should probably try to handle (1), at least, so that the data
> table holds fully accurate info about the flash.

I agree, will try to collect real info and submit a patch!

--=20
Rafa=C5=82
