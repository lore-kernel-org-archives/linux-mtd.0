Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fSEQb-0003Yg-EL
 for linux-mtd@lists.infradead.org; Mon, 11 Jun 2018 04:27:42 +0000
Subject: Re: [RFC PATCH 0/2] mkfs.ubifs: Implement selinux labelling support
To: linux-mtd@lists.infradead.org, richard@nod.at,
 david.oberhollenzer@sigma-star.at
References: <1528277940-30919-1-git-send-email-riteshh@codeaurora.org>
From: Ritesh Harjani <riteshh@codeaurora.org>
Message-ID: <eff83e8b-e058-3262-063d-e7c6ba0e02f0@codeaurora.org>
Date: Mon, 11 Jun 2018 09:57:20 +0530
MIME-Version: 1.0
In-Reply-To: <1528277940-30919-1-git-send-email-riteshh@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Gentle reminder!!

Regards

Ritesh


On 6/6/2018 3:08 PM, Ritesh Harjani wrote:
> Hi All,
>
> This patchset implements the selinux context labelling support
> in mkfs.ubifs utility which was discussed here [1].
> Patchset is based upon previous work done by John [2].
> Commit texts should explain about the change description.
>
> I have tested this on my 4.9 kernel NAND based internal device with
> UBIFS and selinux enabled. With this we are able to set the
> respective selinux labels based on the input file_context provided
> in mkfs.ubifs command.
>
> [1]:- http://lists.infradead.org/pipermail/linux-mtd/2018-May/081138.html
> [2]:- http://lists.infradead.org/pipermail/linux-mtd/2014-February/052136.html
>
> Ritesh Harjani (2):
>    mkfs.ubifs: add_xattr is not depending on host XATTR support
>    mkfs.ubifs: Implement selinux labelling support in mkfs.ubifs.
>
>   Makefile.am                         |   4 +
>   configure.ac                        |  27 +++++
>   ubifs-utils/Makemodule.am           |   4 +-
>   ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 197 ++++++++++++++++++++++++++++--------
>   4 files changed, 189 insertions(+), 43 deletions(-)
>
