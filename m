Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bhe0h-0008PZ-Qj
 for linux-mtd@lists.infradead.org; Wed, 07 Sep 2016 14:39:33 +0000
Subject: Re: [PATCH V2] nanddump: check write function result for errors
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <1468833493-28311-1-git-send-email-zajec5@gmail.com>
 <1468854585-9705-1-git-send-email-zajec5@gmail.com>
 <CACna6ry8YryvvpcVp3hCA-42DX2y9=8hx+807fF2Ri=79dV4Eg@mail.gmail.com>
Cc: Richard Weinberger <richard@nod.at>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Message-ID: <6f29743b-b1d2-7cfa-d4c3-8ceaa7c33d49@sigma-star.at>
Date: Wed, 7 Sep 2016 16:38:26 +0200
MIME-Version: 1.0
In-Reply-To: <CACna6ry8YryvvpcVp3hCA-42DX2y9=8hx+807fF2Ri=79dV4Eg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/06/2016 09:42 PM, Rafał Miłecki wrote:
> On 18 July 2016 at 17:09, Rafał Miłecki <zajec5@gmail.com> wrote:
>> Errors may happen, it's e.g. easy on embedded devices to run out of space
>> when dumping big partitions. This patch adds a helper function for
>> writing. It deals with partial writes and just returns 0 on success or
>> error number.
>>
>> The old code didn't check for errors at all which could result in
>> incomplete dumps without exiting with an error.
>>
>> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
> 
> Can this finally be pushed, please?

Unfortunately the mtd-utils appear to be currently not very well maintained and
a number of patches submitted to the mailing list got more or less neglected.

However there _is_ currently an effort on the way to do a major overhaul/cleanup of
the mtd-utils that also incorporates a bunch of fixes that accumulated on the mailing
list, also including this patch.

You can take a look at the current progress here:

https://github.com/sigma-star/mtd-utils/commits/wip_v2-rc1


David
