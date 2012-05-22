Received: from mail.thb.de ([62.225.75.172] helo=mail.bury.com)
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SWjPd-0001hG-Pk
 for linux-mtd@lists.infradead.org; Tue, 22 May 2012 07:21:46 +0000
Message-ID: <4FBB3E7F.3080807@bury.com>
Date: Tue, 22 May 2012 09:21:35 +0200
From: Robert Homann <homann@bury.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: Resizing of an existing UBIFS
References: <4FBB3506.3020904@bury.com>
 <1337669583.2483.88.camel@sauron.fi.intel.com>
In-Reply-To: <1337669583.2483.88.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 05/22/2012 08:53 AM, Artem Bityutskiy wrote:

Hi!

>> I have a short question: Is it possible to expand the size of a UBIFS
>> without creating a new image file or reformatting from scratch?
>> ...
>
> Unfortunately there are not tools for this :-( You could write one,
> though :-)

OK, thanks. Actually, writing such a tool is not completely out of
question in my case... How hard do you think it would be to implement it?
Would such a tool simply change some values in a few structures or would it
have to do something much more complicated? Or could some existing tool from
mtd-utils be extended to do the job?

Best regards,
Robert Homann
