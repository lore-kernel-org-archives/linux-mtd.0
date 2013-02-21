Received: from natasha.panasas.com ([67.152.220.90])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U8Sb8-0002N7-MU
 for linux-mtd@lists.infradead.org; Thu, 21 Feb 2013 09:37:51 +0000
Message-ID: <5125EAB1.9070002@panasas.com>
Date: Thu, 21 Feb 2013 11:36:49 +0200
From: Boaz Harrosh <bharrosh@panasas.com>
MIME-Version: 1.0
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Subject: Re: [PATCH 6/6] ubifs: Wait for page writeback to provide stable pages
References: <20130119011231.20902.55954.stgit@blackbox.djwong.org>
 <20130119011316.20902.56721.stgit@blackbox.djwong.org>
 <20130123134312.b69c53cd.akpm@linux-foundation.org>
 <20130221034834.GA4055@blackbox.djwong.org>
In-Reply-To: <20130221034834.GA4055@blackbox.djwong.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: lucho@ionkov.net, jack@suse.cz, neilb@suse.de, david@fromorbit.com,
 Adrian Hunter <adrian.hunter@intel.com>, adilger.kernel@dilger.ca,
 jlayton@samba.org, hch@infradead.org, gnehzuil.liu@gmail.com,
 linux-ext4@vger.kernel.org, ericvh@gmail.com, viro@zeniv.linux.org.uk,
 rminnich@sandia.gov, hirofumi@mail.parknet.co.jp, axboe@kernel.dk,
 tytso@mit.edu, martin.petersen@oracle.com,
 Artem Bityutskiy <dedekind1@gmail.com>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/21/2013 05:48 AM, Darrick J. Wong wrote:
> On Wed, Jan 23, 2013 at 01:43:12PM -0800, Andrew Morton wrote:
>> On Fri, 18 Jan 2013 17:13:16 -0800
>> "Darrick J. Wong" <darrick.wong@oracle.com> wrote:
>>
>>> When stable pages are required, we have to wait if the page is just
>>> going to disk and we want to modify it. Add proper callback to
>>> ubifs_vm_page_mkwrite().
>>>
>>> CC: Artem Bityutskiy <dedekind1@gmail.com>
>>> CC: Adrian Hunter <adrian.hunter@intel.com>
>>> CC: linux-mtd@lists.infradead.org
>>> From: Jan Kara <jack@suse.cz>
>>> Signed-off-by: Jan Kara <jack@suse.cz>
>>> Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
>>
>> A couple of these patches had this From:Jan strangely embedded in the
>> signoff area.  I have assumed that they were indeed authored by Jan.
>>
>> Please note that authorship is indicated by putting the From: line
>> right at the start of the chagnelog.
>>
>>
>> I grabbed the patches.  They should appear in linux-next tomorrow if I
>> can get the current pooppile to build.
> 
> Well... these patches have been banging around in -next for a month or so now.
> As far as I know there haven't been any complaints.  Can we push these for 3.9?
> 

Yes, please I'm waiting for these patches as well. Lets push them this merge
window. I was sure they would get in at 3.8, but they didn't. What's the delay?

[Using this I can fix a theoretical raid corruption in exofs local access, which
 no one really cared because exofs is always accessed via pnfs, which does not
 have that bug]

Thanks
Boaz

> --D
> 
