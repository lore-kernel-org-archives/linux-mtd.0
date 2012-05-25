Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SXoVR-0000jc-Az
 for linux-mtd@lists.infradead.org; Fri, 25 May 2012 07:00:14 +0000
Message-ID: <4FBF2DF7.8030809@intel.com>
Date: Fri, 25 May 2012 10:00:07 +0300
From: Adrian Hunter <adrian.hunter@intel.com>
MIME-Version: 1.0
To: Robert Homann <homann@bury.com>
Subject: Re: Resizing of an existing UBIFS
References: <4FBB3506.3020904@bury.com>
 <1337669583.2483.88.camel@sauron.fi.intel.com> <4FBB3E7F.3080807@bury.com>
In-Reply-To: <4FBB3E7F.3080807@bury.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 22/05/12 10:21, Robert Homann wrote:
> On 05/22/2012 08:53 AM, Artem Bityutskiy wrote:
> 
> Hi!
> 
>>> I have a short question: Is it possible to expand the size of a UBIFS
>>> without creating a new image file or reformatting from scratch?
>>> ...
>>
>> Unfortunately there are not tools for this :-( You could write one,
>> though :-)
> 
> OK, thanks. Actually, writing such a tool is not completely out of
> question in my case... How hard do you think it would be to implement it?
> Would such a tool simply change some values in a few structures or would it
> have to do something much more complicated? Or could some existing tool from
> mtd-utils be extended to do the job?

Before writing a tool you should check how much overhead there is in simply
making max-leb-cnt as big as you might ever want.
