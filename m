Received: from mail.thb.de ([62.225.75.172] helo=mail.bury.com)
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SWn0X-0002eV-Fu
 for linux-mtd@lists.infradead.org; Tue, 22 May 2012 11:12:06 +0000
Message-ID: <4FBB747D.10804@bury.com>
Date: Tue, 22 May 2012 13:11:57 +0200
From: Robert Homann <homann@bury.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: Resizing of an existing UBIFS
References: <4FBB3506.3020904@bury.com>
 <1337669583.2483.88.camel@sauron.fi.intel.com> <4FBB3E7F.3080807@bury.com>
 <1337674258.2483.123.camel@sauron.fi.intel.com> <4FBB5B82.8070009@bury.com>
 <Pine.LNX.4.64.1205221138410.4247@lnxricardw.se.axis.com>
 <1337681963.2483.140.camel@sauron.fi.intel.com>
In-Reply-To: <1337681963.2483.140.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/22/2012 12:19 PM, Artem Bityutskiy wrote:

> Yeah, if someone wrote such a tool, it would make sense to support
> shrinking as well, because it is roughly a similar thin - you need to
> relocate data from the end, amend the index and probably some other
> UBIFS data-structures.

This is getting interesting.

On which level would such a tool operate? I guess it would have to do some
low-level operations directly on UBIFS structures, but it would use the UBI
layer below only to get at the corresponding blocks. Other than that, the UBI
structures would not require direct manipulations, am I right? In this case,
such a tool could be implemented without strict dependency on UBI.

Or would it be necessary to also touch UBI structures directly, in which case
I guess it would become much more messy?

Best regards,
Robert Homann
