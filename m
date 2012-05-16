Received: from dalsmrelay2.nai.com ([205.227.136.216])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SUSMx-000350-84
 for linux-mtd@lists.infradead.org; Wed, 16 May 2012 00:45:37 +0000
Message-ID: <4FB2F82E.1040006@snapgear.com>
Date: Wed, 16 May 2012 10:43:26 +1000
From: Greg Ungerer <gerg@snapgear.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH] mtd: clean up uclinux.c map driver
References: <1337054928-16228-1-git-send-email-gerg@snapgear.com>
 <1337087537.2528.206.camel@sauron.fi.intel.com>
In-Reply-To: <1337087537.2528.206.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Greg Ungerer <gerg@uclinux.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 15/05/12 23:12, Artem Bityutskiy wrote:
> On Tue, 2012-05-15 at 14:08 +1000, gerg@snapgear.com wrote:
>> From: Greg Ungerer<gerg@uclinux.org>
>>
>> Perform a number of cleanups on the uclinux.c map driver.
>> No structural or semantic changes, only minor cleanups.
>>
>> . insert appropriate prefix into printk() calls
>> . remove redundant "if" checks in the module exit code
>> . remove unnecessary includes
>> . make the struct uclinux_ram_map static
>> . cast the virtual address calculations to keep them sparse clean
>>
>> Signed-off-by: Greg Ungerer<gerg@uclinux.org>
>
> Thanks, pushed all 3 patches to l2-mtd.git.

Thanks.


> Side note: why do you Cc uclinux-dev@uclinux.org if it is closed mailing
> list. Why do you need to make people replying you see rejects from the
> mailing list?

Most of the users of the uclinux.c map driver will be on the uclinux
mailing list. It is very annoying that it is a closed list, but at
least there is a chance they know changes are being made to some code
they use.

Regards
Greg



------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
