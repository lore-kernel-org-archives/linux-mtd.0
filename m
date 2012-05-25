Received: from mail.thb.de ([62.225.75.172] helo=mail.bury.com)
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SXpGr-0004Gk-0H
 for linux-mtd@lists.infradead.org; Fri, 25 May 2012 07:49:13 +0000
Message-ID: <4FBF396D.4070000@bury.com>
Date: Fri, 25 May 2012 09:49:01 +0200
From: Robert Homann <homann@bury.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: Resizing of an existing UBIFS
References: <4FBB3506.3020904@bury.com>
 <1337669583.2483.88.camel@sauron.fi.intel.com> <4FBB3E7F.3080807@bury.com>
 <4FBF2DF7.8030809@intel.com>
In-Reply-To: <4FBF2DF7.8030809@intel.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/25/2012 09:00 AM, Adrian Hunter wrote:

Hi!

> Before writing a tool you should check how much overhead there is in simply
> making max-leb-cnt as big as you might ever want.

It is definitely a lot simpler to just set this parameter to some big value
and generate new images from scratch since the overhead in space consumption
is not an issue in this case. But let's say, in my case the purpose of using
such a resizing tool is not space optimization, but fixing a former
decision...

I still need to think about whether or not it is worth the effort to write a
resizing tool. Should I decide to make it, I'll first ask around on this list
to provide some suggestions about the features that could and should be
supported while at it. Don't hold your breath, though. :)

Best regards,
Robert Homann
