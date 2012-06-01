Received: from anubis.se.axis.com ([195.60.68.12])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SaOoH-0002dP-4b
 for linux-mtd@lists.infradead.org; Fri, 01 Jun 2012 10:10:22 +0000
Date: Fri, 1 Jun 2012 12:10:11 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: Resizing of an existing UBIFS
In-Reply-To: <4FC340D4.9020905@intel.com>
Message-ID: <Pine.LNX.4.64.1206011133500.4247@lnxricardw.se.axis.com>
References: <4FBB3506.3020904@bury.com>
 <1337669583.2483.88.camel@sauron.fi.intel.com>
 <4FBB3E7F.3080807@bury.com> <4FBF2DF7.8030809@intel.com>
 <4FBF396D.4070000@bury.com>
 <Pine.LNX.4.64.1205250958290.4247@lnxricardw.se.axis.com>
 <4FC340D4.9020905@intel.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Robert Homann <homann@bury.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 28 May 2012, Adrian Hunter wrote:

> On 25/05/12 11:00, Ricard Wanderlof wrote:
>>
>> On Fri, 25 May 2012, Robert Homann wrote:
>>
>>> It is definitely a lot simpler to just set this parameter to some big
>>> value and generate new images from scratch since the overhead in space
>>> consumption is not an issue in this case. But let's say, in my case the
>>> purpose of using such a resizing tool is not space optimization, but
>>> fixing a former decision...
>>
>> I think this is a most important point. Whatever sizing strategy and vol=
ume
>> sizes that are decided upon, one can be sure that a couple of years down=
 the
>> line differing circumstances will require a re-think of that strategy, n=
o
>> matter how well founded the decision was to start with.
>
> Unless you set max_leb_cnt to match the media size.
>
> The point is resizing when max_leb_cnt is not changed is much simpler.

One point I ran into though is that when specifying a larger max-leb-cnt=20
than the size of the volume, by default the journal size also increases
(it is according to Artem 12% of the max-leb-cnt=20
(http://lists.infradead.org/pipermail/linux-mtd/2012-March/040084.html),=20
but on my system it seems to be less than that and varies with the LEB=20
count; see below - perhaps 12% is the maximum size?).

I've got a 128 MB flash with 128 kB blocks on my system, i.e. a LEB size=20
of 129024 and a total LEB count for the whole device of 1024.

Say you have an ~8 MB volume on the flash =3D 65 LEBs, and you create a fil=
e=20
system image for it with a max-leb-cnt of 65. This results in a default=20
journal size of 903168 bytes according to mkfs.ubifs -v. (Incidentally,=20
the journal size here appears to be about 11% of the total LEB count for=20
the volume.)

If you now create a file system image with a max-leb-cnt of 1024, this=20
results in a default journal size of 8388608 =3D 8M which is larger than th=
e=20
space available in the volume. (Incidentally, the journal size in this=20
case appears to be about 6% of the total LEB count specified).

Of course, the volume size could be set to, say, 16 MB instead, but=20
neverthless, 8 MB of this 16 MB volume is then wasted for a journal=20
intended to fit a (future) larger volume size.

So, just increasing max-leb-cnt causes a lot of wasted space in a small=20
volume by default. Of course one could specify a smaller journal size, the=
=20
question is then what journal size to set? Are there any guidelines which=
=20
would be helpful in this case (Artem?) ?

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
