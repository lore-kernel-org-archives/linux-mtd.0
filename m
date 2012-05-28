Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SYvxZ-000517-MZ
 for linux-mtd@lists.infradead.org; Mon, 28 May 2012 09:09:55 +0000
Message-ID: <4FC340D4.9020905@intel.com>
Date: Mon, 28 May 2012 12:09:40 +0300
From: Adrian Hunter <adrian.hunter@intel.com>
MIME-Version: 1.0
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: Resizing of an existing UBIFS
References: <4FBB3506.3020904@bury.com>
 <1337669583.2483.88.camel@sauron.fi.intel.com> <4FBB3E7F.3080807@bury.com>
 <4FBF2DF7.8030809@intel.com> <4FBF396D.4070000@bury.com>
 <Pine.LNX.4.64.1205250958290.4247@lnxricardw.se.axis.com>
In-Reply-To: <Pine.LNX.4.64.1205250958290.4247@lnxricardw.se.axis.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
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

On 25/05/12 11:00, Ricard Wanderlof wrote:
> 
> On Fri, 25 May 2012, Robert Homann wrote:
> 
>> It is definitely a lot simpler to just set this parameter to some big
>> value and generate new images from scratch since the overhead in space
>> consumption is not an issue in this case. But let's say, in my case the
>> purpose of using such a resizing tool is not space optimization, but
>> fixing a former decision...
> 
> I think this is a most important point. Whatever sizing strategy and volume
> sizes that are decided upon, one can be sure that a couple of years down the
> line differing circumstances will require a re-think of that strategy, no
> matter how well founded the decision was to start with.

Unless you set max_leb_cnt to match the media size.

The point is resizing when max_leb_cnt is not changed is much simpler.
