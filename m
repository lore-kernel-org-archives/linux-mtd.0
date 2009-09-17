MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <4AB1F3C5.7000309@gmail.com>
References: <20090917081659.GA28591@july> <4AB1F3C5.7000309@gmail.com>
Date: Thu, 17 Sep 2009 18:45:53 +0900
Message-ID: <9c9fda240909170245u2b21b898v11c3316726746464@mail.gmail.com>
Subject: Re: [PATCH] Samsung SoCs: OneNAND support
From: Kyungmin Park <kmpark@infradead.org>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 17, 2009 at 5:31 PM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> On 09/17/2009 11:16 AM, Kyungmin Park wrote:
>>
>> +static int s3c_onenand_wait(struct mtd_info *mtd, int state)
>> +{
>> + =A0 =A0 =A0 unsigned int flags =3D INT_ACT;
>> + =A0 =A0 =A0 unsigned int stat, ecc;
>> + =A0 =A0 =A0 unsigned long timeout;
>> +
>> + =A0 =A0 =A0 switch (state) {
>> + =A0 =A0 =A0 case FL_READING:
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 flags |=3D BLK_RW_CMP | LOAD_CMP;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> + =A0 =A0 =A0 case FL_WRITING:
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 flags |=3D BLK_RW_CMP | PGM_CMP;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> + =A0 =A0 =A0 case FL_ERASING:
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 flags |=3D BLK_RW_CMP | ERS_CMP;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> + =A0 =A0 =A0 case FL_LOCKING:
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 flags |=3D BLK_RW_CMP;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> + =A0 =A0 =A0 default:
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> + =A0 =A0 =A0 }
>> +
>> + =A0 =A0 =A0 /* The 20 msec is enough */
>> + =A0 =A0 =A0 timeout =3D jiffies + msecs_to_jiffies(20);
>> + =A0 =A0 =A0 while (time_before(jiffies, timeout)) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 stat =3D s3c_read_reg(INT_ERR_STAT_OFFSET)=
;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (stat& =A0flags)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (state !=3D FL_READING)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cond_resched();
>> + =A0 =A0 =A0 }
>> + =A0 =A0 =A0 /* To get correct interrupt status in timeout case */
>> + =A0 =A0 =A0 stat =3D s3c_read_reg(INT_ERR_STAT_OFFSET);
>> + =A0 =A0 =A0 s3c_write_reg(stat, INT_ERR_ACK_OFFSET);
>> +
>> + =A0 =A0 =A0 /*
>> + =A0 =A0 =A0 =A0*
>> + =A0 =A0 =A0 =A0* In the Spec. it checks the controller status first
>> + =A0 =A0 =A0 =A0* However if you get the correct information in case of
>> + =A0 =A0 =A0 =A0* power off recovery (POR) test, it should read ECC sta=
tus first
>> + =A0 =A0 =A0 =A0*/
>> + =A0 =A0 =A0 if (stat& =A0LOAD_CMP) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ecc =3D s3c_read_reg(ECC_ERR_STAT_OFFSET);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ecc& =A0ONENAND_ECC_4BIT_UNCORRECTABLE=
) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_INFO "onenand_=
wait: ECC error =3D
>> 0x%04x\n", ecc);
>
> Copy-paste error? Also see below.

Nice catch.

>
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mtd->ecc_stats.failed++;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EBADMSG;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 =A0 }
>> +
>> + =A0 =A0 =A0 if (stat& =A0(LOCKED_BLK | ERS_FAIL | PGM_FAIL | LD_FAIL_E=
CC_ERR)) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_INFO "s3c_onenand_wait: contro=
ller error =3D
>> 0x%04x\n", stat);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (stat& =A0LOCKED_BLK)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_INFO "s3c_onen=
and_wait: it's locked
>> error =3D 0x%04x\n", stat);
>
> Very quick comment. Could you please avoid this style of putting function
> name to the printk? We have lots of this in onenand_base.c, and they are
> often wrong, because function names change.
>
> Could we please use dev_printk(), dev_dbg() and the like instead? You'll
> have
> to do some more work and make MTD a bit more linux-device-model-friendly,
> but
> someone has to do this :-)
>
> But in the worst case, use at least %s + __func__.
>
> And you could also clean things up similarly for onenenand.

Okay I will use the your recommended. After more review. I will resend it.

Thank you,
Kyungmin Park
