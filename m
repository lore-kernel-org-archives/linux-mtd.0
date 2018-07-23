Received: from mail.rptsys.com ([192.119.205.245])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fhfRH-0003i3-Kd
 for linux-mtd@lists.infradead.org; Mon, 23 Jul 2018 18:20:09 +0000
Message-ID: <5B561C49.6040208@raptorengineering.com>
Date: Mon, 23 Jul 2018 13:19:53 -0500
From: Timothy Pearson <tpearson@raptorengineering.com>
MIME-Version: 1.0
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
CC: linux-mtd@lists.infradead.org, Stewart Smith <stewart@linux.vnet.ibm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH] mtd/powernv_flash: Enable partition support
References: <1959109367.8330026.1532336539584.JavaMail.zimbra@raptorengineeringinc.com>
 <CACna6ryaT7Q=FSH_UBs5p6H3VdkpeKH_AYbQ=_WPB7N3xqoaOg@mail.gmail.com>
In-Reply-To: <CACna6ryaT7Q=FSH_UBs5p6H3VdkpeKH_AYbQ=_WPB7N3xqoaOg@mail.gmail.com>
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

On 07/23/2018 05:14 AM, Rafa=C5=82 Mi=C5=82ecki wrote:
> On Mon, 23 Jul 2018 at 11:02, Timothy Pearson
> <tpearson@raptorengineering.com> wrote:
>> On certain systems, such as the Talos II, skiboot emits a partition
>> table for the main PNOR MTD device in the generated device tree.
>>
>> Allow this partition table to be parsed and the partitions to be
>> exposed via MTD device partition nodes.
>>
>> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
>=20
> This already has been handled in the:
> [PATCH] mtd: powernv_flash: set of_node in mtd's dev
> https://patchwork.ozlabs.org/patch/943327/
>=20
> I marked you as reporter, I Cc-ed you, Boris replied to it. I didn't
> expect you to miss that change.

Thank you for the information.  I did miss the change, not sure how, so
my apologies.

--=20
Timothy Pearson
Raptor Engineering
+1 (415) 727-8645 (direct line)
+1 (512) 690-0200 (switchboard)
https://www.raptorengineering.com
