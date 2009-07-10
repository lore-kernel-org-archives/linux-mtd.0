Message-ID: <46328.192.168.10.89.1247206572.squirrel@dbdmail.itg.ti.com>
In-Reply-To: <61362.192.168.10.89.1246961990.squirrel@dbdmail.itg.ti.com>
References: <61362.192.168.10.89.1246961990.squirrel@dbdmail.itg.ti.com>
Date: Fri, 10 Jul 2009 11:46:12 +0530 (IST)
Subject: Re: [PATCH] nand_base.c: removing function names from debug prints
	and      using macro '__func__'
From: "vimal singh" <vimalsingh@ti.com>
To: dedekind@infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On Fri, Jul 10, 2009 at 11:23 AM, Artem Bityutskiy<dedekind@infradead.org> wrote:
> On Tue, 2009-07-07 at 15:49 +0530, vimal singh wrote:
>> Correcting debug prints by removing function names from print messages
>> and using '__func__' macro instead.
>>
>> Function names were wrong in few places.
>>
>> Signed-off-by: Vimal Singh <vimalsingh@ti.com>
>
> Yet another unapplicapple patch. Care to take a look at
> Documentation/email-clients.txt?
>
> Anyway, I've amended this one manually, thanks for the patch.

Thanks Artem. I'll take care of this in future.
>
> --
> Best regards,
> Artem Bityutskiy (&#1041;&#1080;&#1090;&#1102;&#1094;&#1082;&#1080;&#1081;
&#1040;&#1088;&#1090;&#1105;&#1084;)
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
