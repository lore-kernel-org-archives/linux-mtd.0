Received: from mx01-sz.bfs.de ([194.94.69.67])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V1Aui-0000MA-Ll
 for linux-mtd@lists.infradead.org; Mon, 22 Jul 2013 07:52:13 +0000
Message-ID: <51ECE488.1050307@bfs.de>
Date: Mon, 22 Jul 2013 09:51:36 +0200
From: walter harms <wharms@bfs.de>
MIME-Version: 1.0
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [patch] mtd: use correct error codes in debugfs_create()
References: <20130719054938.GC9729@elgon.mountain>
 <20130722055607.GF5636@mwanda>
In-Reply-To: <20130722055607.GF5636@mwanda>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org
Reply-To: wharms@bfs.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Am 22.07.2013 07:56, schrieb Dan Carpenter:
> On Fri, Jul 19, 2013 at 08:49:38AM +0300, Dan Carpenter wrote:
>> The test here is reversed.  It should be that if "dent" is a valid error
>> code then we use it, otherwise if it is NULL then use -ENODEV.
>>
> 
> People have explained the debugfs_create API to me better and now
> I'm not sure what to do here...  debugfs_create_dir() returns a
> NULL on error and if debugfs is not enabled then it returns -ENODEV.
> We test for if (!IS_ENABLED(CONFIG_DEBUG_FS)) earlier in the
> function so it can only return NULL.
> 
> Probably I should just change the test to only test for NULL?
> 
> Otherwise I think my patch is correct.  The original code will
> return success on error (NULL return) and that was not intended.
> 

Hi Dan,
i have a simple question, what to do in case of error ?

Situation 1: debugfs_create_dir returns NULL
something went wrong dir not created
if all other debugfs_ function will check for NULL someone could even ignore the check
and let the others handle that.

Situation 2: debugfs_create_dir returns ENODOV
The man page says: please ignore
I only use i could come up with is to inform the user that no debugfs is available.
But the returning pointer would now point to an error an not the expected dentry.
So have to you make sure that it becomes NULL otherwise the other debugfs function will go crasy.
(Can this happen actually ?)
Did i miss something ?

In Summa:
may it is better for debugfs_ to return NULL instead of an error ?

re,
 wh
