Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y0R9a-00068m-FY
 for linux-mtd@lists.infradead.org; Mon, 15 Dec 2014 08:37:19 +0000
Message-ID: <548E9DA0.8070407@nod.at>
Date: Mon, 15 Dec 2014 09:36:48 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Yan Kong <ykong@sierrawireless.com>
Subject: Re: UBI errors when "ls -l"
References: <loom.20141210T102753-582@post.gmane.org>
 <CAFLxGvwqdi6T9zg_QH5Uw3D7R0dUPbX0G-7wDX6p47RBWoSdFw@mail.gmail.com>
 <740E8392C144C64FA5300E5E696A179BB97FEBB16F@carmd-exchmb01.sierrawireless.local>
 <5488498B.4030902@nod.at>
 <740E8392C144C64FA5300E5E696A179BB97FEBB176@carmd-exchmb01.sierrawireless.local>
 <548850C3.8000204@nod.at>
 <740E8392C144C64FA5300E5E696A179BB97FEBB85C@carmd-exchmb01.sierrawireless.local>
 <548AA590.7060200@nod.at>
 <740E8392C144C64FA5300E5E696A179BB97FEBBAE9@carmd-exchmb01.sierrawireless.local>
In-Reply-To: <740E8392C144C64FA5300E5E696A179BB97FEBBAE9@carmd-exchmb01.sierrawireless.local>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

Am 15.12.2014 um 04:30 schrieb Yan Kong:
> Hi Richard,
> 
> The FAE tell me that now mtd driver doesn't support only write OOB area, but not write data area. So mtd_oobtest.

This sentence does not parse.

> But they are not sure if it is related to the UBI error. What do you think about it?

Fact is that mtd_read() returns less bytes than requested. This must not happen and is most
likely a driver issue.
I'd start investigating here.
Almost all "UBI issues" I inspect for customers turn out to be plain mtd driver bugs.

> Another thing is that, I tried to enable nandsim in my Kernel, but saw that "Sub-page size" and "OOB size" of nandsim partition are different from local mtd partition's.
> The parameter of nandsim are as follows, which is copied from boot up logs.
> Command of insmod nandsim is:
> modprobe nandsim first_id_byte=0x2c second_id_byte=0xac third_id_byte=0x90 fourth_id_byte=0x26
> Is the parameter I used wrong?

If the ID bytes are correct everything work fine.

Thanks,
//richard
