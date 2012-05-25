Received: from mika.eatserver.nl ([195.20.9.75])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SXrVy-0004e7-Vt
 for linux-mtd@lists.infradead.org; Fri, 25 May 2012 10:13:00 +0000
Received: from [195.242.97.150] (qore.networks.above.net [195.242.97.150] (may
 be forged)) (authenticated bits=0)
 by mika.eatserver.nl (8.13.8/8.13.8) with ESMTP id q4PACnmO003656
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
 for <linux-mtd@lists.infradead.org>; Fri, 25 May 2012 12:12:49 +0200
Received: from localhost (localhost.localhost [127.0.0.1])
 by router38.aimvalley.nl (Postfix) with ESMTP id 6E35D818303
 for <linux-mtd@lists.infradead.org>; Fri, 25 May 2012 12:12:49 +0200 (CEST)
Received: from mail3.aimsys.nl (mail.aimsys.nl [10.10.0.114])
 by router38.aimvalley.nl (Postfix) with ESMTP id 05D6D818302
 for <linux-mtd@lists.infradead.org>; Fri, 25 May 2012 12:12:49 +0200 (CEST)
Message-ID: <4FBF5B20.50406@aimvalley.nl>
Date: Fri, 25 May 2012 12:12:48 +0200
From: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: Resizing of an existing UBIFS
References: <4FBB3506.3020904@bury.com>
 <1337669583.2483.88.camel@sauron.fi.intel.com>
In-Reply-To: <1337669583.2483.88.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/22/12 08:53, Artem Bityutskiy wrote:
> On Tue, 2012-05-22 at 08:41 +0200, Robert Homann wrote:
>> Hi,
>>
>> I have a short question: Is it possible to expand the size of a UBIFS
>> without creating a new image file or reformatting from scratch?
>>
>> Suppose you have a UBIFS whose --max-leb-cnt has been set so to limit
>> its size to 100 MiB. Now suppose this UBIFS lives in a dynamic UBI
>> volume which gets expanded to a size of the whole partition, say,
>> 150 MiB. Being limited by the --max-leb-cnt parameter, the contained
>> UBIFS is expanded to only 100 MiB, and the rest of the space in the
>> volume is wasted. Is it possible to resize the UBIFS so that it can make
>> use of the now wasted space?
>
> Unfortunately there are not tools for this :-( You could write one,
> though :-)
>


This is not a problem for a UBIFS being created dynamically, so with
ubiformat + ubiattach + ubimkvol ? In this case the size of the lprops
area is determined by the total amount of LEBs of the MTD partition ?

A UBIFS volume can then be resized with ubirsvol as long as it does not
conflict with other volumes and does not exceed the total amount of
LEBs of the MTD partition ?

---
N. van Bolhuis.
