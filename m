From: "Gupta, Pekon" <pekon@ti.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Brian Norris
 <computersforpeace@gmail.com>
Subject: RE: [PATCH 1/4] mtd: Add sysfs attr to expose ECC stats
Date: Tue, 15 Apr 2014 11:13:52 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAC31AE@DBDE04.ent.ti.com>
References: <1395403064-28113-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1395403064-28113-2-git-send-email-ezequiel.garcia@free-electrons.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAB91D7@DBDE04.ent.ti.com>
 <20140401111359.GA3324@arch.cereza>
In-Reply-To: <20140401111359.GA3324@arch.cereza>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ezequiel,

>From: Ezequiel Garcia
>>On Mar 27, Gupta, Pekon wrote:
>> >
>> >+static ssize_t mtd_ecc_stats_show(struct device *dev,
>> >+		struct device_attribute *attr, char *buf)
>> >+{
>> >+	struct mtd_info *mtd =3D dev_get_drvdata(dev);
>> >+	struct mtd_ecc_stats *ecc_stats =3D &mtd->ecc_stats;
>> >+
>> >+	return snprintf(buf, PAGE_SIZE, "%8u %8u %8u %8u\n", ecc_stats->corre=
cted,
>> >+						ecc_stats->failed,
>> >+						ecc_stats->badblocks,
>> >+						ecc_stats->bbtblocks);
>> Though I would have liked to see each field of ecc_stats as a separate s=
ysfs entry
>
>I tried to match the ecc_stats structure exactly in the sysfs entry. Keep
>in mind creating/keeping a sysfs file has its cost. Since it's trivial
>to get one of the fields with any text parsing tool I didn't think having
>a file per stat was worth it.
>
There are some guidelines about attributes in 'Documentation/filesystems/sy=
sfs.txt'
Though it's acceptable to put array of values of the "same type" in single =
sysfs file,
But I'm still not confident on having all members of 'struct ecc_stats' bei=
ng
represented by single sysfs file because:

(1) ecc_stat represents variety of information like
  ecc_stats->failed: may be used to debug | analyze a access failure.
  ecc_stats->badblocks: may be used to determine the health of flash device=
.
  So, keeping these information in separate sysfs files seemed more user-fr=
iendly.

(2) Having single sysfs file may constrains future expansion of 'struct ecc=
_stats'
   as we have to stick to "same type" members.

I'm just raising these doubts because it's difficult to change sysfs attrib=
utes
once they are merged, as it might break user-space compatibility.

(feedbacks from other are welcomed)..

>> But, I don't know what it impacts to keep it different from /sys/block/<=
device>/stat
>> Do you know any user-space tools which utilize these, and can be re-used=
 on
>> UBI-block kind of layer, if we keep this compatibility ?
>>
>
>It won't impact as they are two completely different things. The ecc_stats
>output is only "vaguely inspired" in block stats; but these are two comple=
tely
>different stats. It's not about tool reusability, but about consistency.
>
>> Also, How about printing what these numbers mean ?
>> I hope this will still keep it machine readable.
>
>Well, this is not a debugfs entry, so I'm not sure we want to add such deb=
ug
>information. Anyone can take a look at the code and see what ecc_stats mea=
n.
>
>On the other side, I don't have a strong opinion on this.
>
>>
>> Also please update "Documentation/ABI/testing/sysfs-class-mtd"
>> with details about 'ecc_stats'
>>
>
>OK, I will.

>--
>Ezequiel Garc=EDa, Free Electrons
>Embedded Linux, Kernel and Android Engineering
>http://free-electrons.com
>

with regards, pekon
