Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dO9qf-00053m-EP
 for linux-mtd@lists.infradead.org; Thu, 22 Jun 2017 21:41:11 +0000
Received: by mail-ot0-x241.google.com with SMTP id q16so3133526otb.0
 for <linux-mtd@lists.infradead.org>; Thu, 22 Jun 2017 14:40:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170622210533.GD14148@google.com>
References: <20170526131415.27186-1-zajec5@gmail.com>
 <20170621062647.6072-1-zajec5@gmail.com>
 <20170621062647.6072-3-zajec5@gmail.com> <20170622210533.GD14148@google.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Thu, 22 Jun 2017 23:40:47 +0200
Message-ID: <CACna6rw3B5=48qbRK+vQ1gsxsZtCtJfNa=kORZY6FrCko5PJFg@mail.gmail.com>
Subject: Re: [PATCH V7 2/6] mtd: partitions: remove sysfs files when deleting
 all master's partitions
To: Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Dan Ehrenberg <dehrenberg@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 22 June 2017 at 23:05, Brian Norris <computersforpeace@gmail.com> wrote:
> On Wed, Jun 21, 2017 at 08:26:43AM +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
>> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>>
>> When support for sysfs "offset" file was added it missed to update the
>> del_mtd_partitions function. It deletes partitions just like
>> mtd_del_partition does so both should also take care of removing sysfs
>> files.
>>
>> This change moves sysfs_remove_files call to the shared function to fix
>> this issue.
>>
>> Fixes: a62c24d755291 ("mtd: part: Add sysfs variable for offset of parti=
tion")
>> Cc: Dan Ehrenberg <dehrenberg@chromium.org>
>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>> ---
>> V7: Introduction of this patch, it was separated from the 1/6. It should
>>     be clear now that this change is introduced. If something goes wrong
>>     it should also be easier to revert it this way.
>
> Thanks, splitting this out is nice actually. And thanks for looking up
> the background on this oversight.
>
> I'm not really sure what the actual effect of that omission would be;
> the file won't be left dangling in sysfs (the device is removed
> entirely), but I'm not sure if that'd trigger some kind of internal
> kobject memory leak.
>
> Anyway, looks good to me.

In the worst case it looks like a small cleanup of the exit path.


> Side note: this patch series sort of massages the definition of this
> "offset" file. Now, IIUC, subpartitions will have an "offset" file
> relative to their parent partition, not the master flash device. I'm not
> sure which way is expected.

I didn't think about this. I should be able to easily get an absolute
offset if needed (a simple recursion), but I'm not sure what behavior
is actually expected. Since we use a tree struct in the sysfs now,
maybe relative offsets are actually correct ones?

--=20
Rafa=C5=82
