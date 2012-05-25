Received: from ra.se.axis.com ([195.60.68.13])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SXpRc-0004Yf-PH
 for linux-mtd@lists.infradead.org; Fri, 25 May 2012 08:00:21 +0000
Date: Fri, 25 May 2012 10:00:16 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Robert Homann <homann@bury.com>
Subject: Re: Resizing of an existing UBIFS
In-Reply-To: <4FBF396D.4070000@bury.com>
Message-ID: <Pine.LNX.4.64.1205250958290.4247@lnxricardw.se.axis.com>
References: <4FBB3506.3020904@bury.com>
 <1337669583.2483.88.camel@sauron.fi.intel.com>
 <4FBB3E7F.3080807@bury.com> <4FBF2DF7.8030809@intel.com>
 <4FBF396D.4070000@bury.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 25 May 2012, Robert Homann wrote:

> It is definitely a lot simpler to just set this parameter to some big=20
> value and generate new images from scratch since the overhead in space=20
> consumption is not an issue in this case. But let's say, in my case the=
=20
> purpose of using such a resizing tool is not space optimization, but=20
> fixing a former decision...

I think this is a most important point. Whatever sizing strategy and=20
volume sizes that are decided upon, one can be sure that a couple of years=
=20
down the line differing circumstances will require a re-think of that=20
strategy, no matter how well founded the decision was to start with.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
