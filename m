Received: from na3sys009aog111.obsmtp.com ([74.125.149.205])
	by canuck.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QRQJX-0004pU-Uy
	for linux-mtd@lists.infradead.org; Tue, 31 May 2011 14:53:04 +0000
Received: by mail-vx0-f179.google.com with SMTP id 40so4530773vxi.24
	for <linux-mtd@lists.infradead.org>;
	Tue, 31 May 2011 07:52:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <BANLkTinu7dX5Tfhs0ak0BEfc212mpJKb+w@mail.gmail.com>
References: <cover.1306780983.git.bengardiner@nanometrics.ca>
	<BANLkTinu7dX5Tfhs0ak0BEfc212mpJKb+w@mail.gmail.com>
Date: Tue, 31 May 2011 10:52:56 -0400
Message-ID: <BANLkTikPqkDON4mzBEko46JdgACrbTOiiA@mail.gmail.com>
Subject: Re: [PATCH 0/3] fix-up free space earlier in mount_ubifs()
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: "Matthew L. Creech" <mlcreech@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Adrian Hunter <adrian.hunter@nokia.com>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Matthew,

On Tue, May 31, 2011 at 10:43 AM, Matthew L. Creech <mlcreech@gmail.com> wr=
ote:
> On Mon, May 30, 2011 at 2:56 PM, Ben Gardiner
> <bengardiner@nanometrics.ca> wrote:
>> In testing Mattew Creech's free-space-fixup flag series I found that was=
 unable
>> to boot a da850evm which had flashed to it's NAND a ubinized image conta=
ining a
>> UBIFS that has the free-space-fixup flag set.
>>
>> The cause of the problem was found to be the call to ubifs_write_master(=
) from
>> mount_ubifs() as is evidenced the backtrace produced by the assertion
>> introduced in the first patch of this series; where the assertion introd=
uced is
>> that c->space_fixup is false when ubifs_write_node() is called.
>>
>
> Interesting - so the problem is that if ubifs_read_master() resizes
> the master node, a subsequent attempt to read the first (c->mst_offs +
> c->mst_node_alsz) bytes from the master LEB fails?
>
> I wonder why this is the case when free-space fixup is enabled, and
> not otherwise? =A0The -EBADMSG seems to imply that this is the original
> problem that the fix-up is intended to solve - i.e. the master node
> has empty pages with non-empty OOB values, and writing to them results
> in a bogus ECC.

Right. I should have mentioned that it is also true that without
free-space-fixup the initial flash of a UBInized image containing a
UBIFS volume results in a bootable system which can mount the rootfs
_the first time only_ subsequent attemps at mounting result in a
failure to mount due to -74 errors.

> Just trying to fully understand the error. =A0:) =A0That aside, this patc=
h
> set makes sense to me. =A0Thanks!

Thank you for your endorsement. Can we take that as a Reviewed-by ?

Best Regards,
Ben Gardiner

---
Nanometrics Inc.
http://www.nanometrics.ca
