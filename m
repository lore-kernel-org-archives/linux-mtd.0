Received: from bear.ext.ti.com ([192.94.94.41])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WmbuJ-0002Hd-UP
 for linux-mtd@lists.infradead.org; Tue, 20 May 2014 04:44:08 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Brian Norris
 <computersforpeace@gmail.com>
Subject: RE: [PATCH v2] mtd: nand: omap: fix BCHx ecc.correct to return
 detected bit-flips in erased-page
Date: Tue, 20 May 2014 04:43:35 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EACE4A3@DBDE04.ent.ti.com>
References: <1395730699-14687-1-git-send-email-pekon@ti.com>
 <20140512203626.GS28907@ld-irv-0074>
 <20980858CB6D3A4BAE95CA194937D5E73EACDE66@DBDE04.ent.ti.com>
 <20140519122052.GA698@arch.cereza>
In-Reply-To: <20140519122052.GA698@arch.cereza>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Stefan Roese <sr@denx.de>, linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From: Ezequiel Garcia [mailto:ezequiel.garcia@free-electrons.com]
>>On 19 May 05:00 AM, Gupta, Pekon wrote:
>> >From: Brian Norris [mailto:computersforpeace@gmail.com]
>>> >On Tue, Mar 25, 2014 at 12:28:19PM +0530, Pekon Gupta wrote:

>> >> fixes: commit 62116e5171e00f85a8d53f76e45b84423c89ff34
>> >>        mtd: nand: omap2: Support for hardware BCH error correction.
>> >>
>> >> In omap_elm_correct_data(), if bitflip_count in an erased-page is wit=
hin the
>> >> correctable limit (< ecc.strength), then it is not indicated back to =
the caller
>> >> ecc->read_page().
>> >> This mis-guides upper layers like MTD and UBIFS layer to assume erase=
d-page as
>> >> perfectly clean and use it for writing even if actual bitflip_count w=
as
>> >> dangerously high (bitflip_count > mtd->bitflip_threshold).
>> >>
>> >> This patch fixes this above issue, by returning 'stats' to caller
>> >> ecc->read_page() under all scenarios.
>> >>
>> >> Reported-by: Brian Norris <computersforpeace@gmail.com>
>> >> Signed-off-by: Pekon Gupta <pekon@ti.com>
>> >
>> >Pushed to l2-mtd.git. Thanks!
>> >
>>
>> Just forgot to ask, Is this patch candidate for stable?
>>
>> This one fixes the long standing issue of returning bit-flip count of an
>> erased-page to upper layers. So that upper layers take correct decision.
>>
>
>Yes, if the commit fixes a bug then it can be marked for stable.
>There's some instructions on this subject, please take a look at [1] and [=
2].
>I think this patch qualifies the stable rules.
>
>In particular, if a patch fixes a bug and you know the culprit commit you
>can add a Fixes tag to pass such information, with a 12-digit commit ID an=
d
>the commit title enclosed in double-quotes [1]:
>
>  Fixes: 62116e5171e0 ("mtd: nand: omap2: Support for hardware BCH error c=
orrection")
>
>To mark it for stable [2], you need add a Cc tag like this:
>
>  Cc: <stable@vger.kernel.org> # 3.x.y
>
Yes, the "fixes" tag is there in the commit log.
And I had requested Brian earlier to see if this can be marked for stable.
I think he missed that email while pushing this patch.

CC: <stable@vger.kernel.org> # 3.9.x+
http://lists.infradead.org/pipermail/linux-mtd/2014-March/052843.html



>You can use something like this to find the releases that contain the bug:
>
>git tag -l --contains 62116e5171e0 | grep ^v3
>
>It's handy to add that as a git alias:
>
>[alias]
>  ..
>  ontags =3D !sh -c 'git tag -l --contains $1 | grep ^v[23]' -
>
>However, now that Brian has pushed the patch, you don't need to do any of
>this. AFAIK, maintainers usually take care of all the above.
>
Thanks Ezequiel, this is helpful ..
But now as this patch is not marked with stable tag, I doubt it will
be pulled in by stable-tree maintainers, as they run a script on linus'
tree and fetch only those commits which have CC: <stable@vger.kernel.org>

So, I just want to check with Brian, if there is a possibility he can edit
The commit log and mark this one for stable? Since he has still not sent
a pull request ..=20


Brian,

This fix is really important to be marked as stable, as some users of OMAP
platforms have spawning out from 3.10 and 3.12 kernel to go for production.
And quite a few of them might be using NAND for their booting purpose,
so without this patch any bit-flip on their erased-pages will not be detect=
ed.



>[1] Documentation/SubmittingPatches
>[2] Documentation/stable_kernel_rules.txt.
>
>Hope this helps,

Sure.. Thanks.


with regards, pekon
