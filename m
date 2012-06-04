Received: from anubis.se.axis.com ([195.60.68.12])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SbThj-0000sk-IN
 for linux-mtd@lists.infradead.org; Mon, 04 Jun 2012 09:36:05 +0000
Date: Mon, 4 Jun 2012 11:35:56 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: Resizing of an existing UBIFS
In-Reply-To: <4FCC6A9D.4010208@intel.com>
Message-ID: <Pine.LNX.4.64.1206041134440.24047@lnxricardw.se.axis.com>
References: <4FBB3506.3020904@bury.com>
 <1337669583.2483.88.camel@sauron.fi.intel.com>
 <4FBB3E7F.3080807@bury.com> <4FBF2DF7.8030809@intel.com>
 <4FBF396D.4070000@bury.com>
 <Pine.LNX.4.64.1205250958290.4247@lnxricardw.se.axis.com>
 <4FC340D4.9020905@intel.com>
 <Pine.LNX.4.64.1206011133500.4247@lnxricardw.se.axis.com>
 <4FC8AC00.7020309@intel.com>
 <Pine.LNX.4.64.1206012135000.20240@lnxricardw.se.axis.com>
 <4FCC6A9D.4010208@intel.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: =?iso-8859-1?Q?Ricard_Wanderl=F6f?= <ricardw@axis.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Robert Homann <homann@bury.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 4 Jun 2012, Adrian Hunter wrote:

>> So what you're saying is that basically it's the worst-case mount time t=
hat
>> together with the read speed sets the maximum journal size?
>
> Generally yes.

>> What I'm getting at in a more concrete sense, is that if I create an emp=
ty 8
>> MB UBI volume, then mount it as a ubifs file system (rather than
>> mkfs.ubifs'ing an empty directory, setting appropriate parameters on the
>> mkfs.ubifs command line, and ubiupdatevol'ing that), can I specify a max=
imum
>> LEB count (and fix the journal size) that would be appropriate also for =
a
>> future larger volume size?
>
> No sorry.  UBIFS auto-formatting (aka default file system creation) takes=
 no
> parameters.  Maximum LEB count is simply set to the actual LEB count.

Ok, thanks for confirming that.

I suppose it would be possible to add some sysfs-parameter or similar to=20
add this functionality?

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
