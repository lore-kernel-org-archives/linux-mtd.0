Received: from zose-mta13.web4all.fr ([178.33.204.91])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SbWUh-00061W-27
 for linux-mtd@lists.infradead.org; Mon, 04 Jun 2012 12:34:48 +0000
Date: Mon, 4 Jun 2012 14:38:51 +0200 (CEST)
From: =?utf-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau@advansee.com>
To: Rusty Russell <rusty@rustcorp.com.au>
Message-ID: <28190110.1966162.1338813531173.JavaMail.root@advansee.com>
In-Reply-To: <87ipf71ytx.fsf@rustcorp.com.au>
Subject: Re: init: multi param parsing regression since 3.4
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: Pawel Moll <pawel.moll@arm.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 linux-kernel@vger.kernel.org,
 benoit thebaudeau <benoit.thebaudeau@advansee.com>,
 linux-mtd@lists.infradead.org, Linus Torvalds <torvalds@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jun 4, 2012 at 6:32:42AM, Rusty Russell wrote:
> Erk, I tested it and you're right.  Level 0 is 'early' initcalls, but
> traditional module parameters are called even earlier.  Simplest fix
> is to move the default parameters to -1.
>=20
> This works for me:
>=20
> Subject: module_param: stop double-calling parameters.
> From: Rusty Russell <rusty@rustcorp.com.au>
>=20
> Commit 026cee0086fe1df4cf74691cf273062cc769617d "params:
> <level>_initcall-like kernel parameters" set old-style module
> parameters to level 0.  And we call those level 0 calls where we used
> to, early in start_kernel().
>=20
> We also loop through the initcall levels and call the levelled
> module_params before the corresponding initcall.  Unfortunately level
> 0 is early_init(), so we call the standard module_param calls twice.
>=20
> (Turns out most things don't care, but at least ubi.mtd does).
>=20
> Change the level to -1 for standard module_param calls.
>=20
> Reported-by: Beno=C3=AEt Th=C3=A9baudeau <benoit.thebaudeau@advansee.com>
> Signed-off-by: Rusty Russell <rusty@rustcorp.com.au>
> Cc: stable@kernel.org
>=20
> diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
> --- a/drivers/mtd/ubi/build.c
> +++ b/drivers/mtd/ubi/build.c
> @@ -1293,6 +1293,8 @@ static int __init ubi_mtd_param_parse(co
>  =09char *pbuf =3D &buf[0];
>  =09char *tokens[2] =3D {NULL, NULL};
> =20
> +=09printk("ubi_mtd_param_parse: val =3D %s\n", val);
> +=09WARN_ON(1);
>  =09if (!val)
>  =09=09return -EINVAL;
> =20
> diff --git a/include/linux/moduleparam.h
> b/include/linux/moduleparam.h
> --- a/include/linux/moduleparam.h
> +++ b/include/linux/moduleparam.h
> @@ -128,7 +128,7 @@ struct kparam_array
>   * The ops can have NULL set or get functions.
>   */
>  #define module_param_cb(name, ops, arg, perm)=09=09=09=09      \
> -=09__module_param_call(MODULE_PARAM_PREFIX, name, ops, arg, perm, 0)
> +=09__module_param_call(MODULE_PARAM_PREFIX, name, ops, arg, perm, -1)
> =20
>  /**
>   * <level>_param_cb - general callback for a module/cmdline
>   parameter
> @@ -192,7 +192,7 @@ struct kparam_array
>  =09=09 { (void *)set, (void *)get };=09=09=09=09\
>  =09__module_param_call(MODULE_PARAM_PREFIX,=09=09=09\
>  =09=09=09    name, &__param_ops_##name, arg,=09=09\
> -=09=09=09    (perm) + sizeof(__check_old_set_param(set))*0, 0)
> +=09=09=09    (perm) + sizeof(__check_old_set_param(set))*0, -1)
> =20
>  /* We don't get oldget: it's often a new-style param_get_uint, etc.
>  */
>  static inline int
> @@ -272,7 +272,7 @@ static inline void __kernel_param_unlock
>   */
>  #define core_param(name, var, type, perm)=09=09=09=09\
>  =09param_check_##type(name, &(var));=09=09=09=09\
> -=09__module_param_call("", name, &param_ops_##type, &var, perm, 0)
> +=09__module_param_call("", name, &param_ops_##type, &var, perm, -1)
>  #endif /* !MODULE */
> =20
>  /**
> @@ -290,7 +290,7 @@ static inline void __kernel_param_unlock
>  =09=09=3D { len, string };=09=09=09=09=09\
>  =09__module_param_call(MODULE_PARAM_PREFIX, name,=09=09=09\
>  =09=09=09    &param_ops_string,=09=09=09=09\
> -=09=09=09    .str =3D &__param_string_##name, perm, 0);=09\
> +=09=09=09    .str =3D &__param_string_##name, perm, -1);=09\
>  =09__MODULE_PARM_TYPE(name, "string")
> =20
>  /**
> @@ -432,7 +432,7 @@ extern int param_set_bint(const char *va
>  =09__module_param_call(MODULE_PARAM_PREFIX, name,=09=09=09\
>  =09=09=09    &param_array_ops,=09=09=09=09\
>  =09=09=09    .arr =3D &__param_arr_##name,=09=09=09\
> -=09=09=09    perm, 0);=09=09=09=09=09\
> +=09=09=09    perm, -1);=09=09=09=09=09\
>  =09__MODULE_PARM_TYPE(name, "array of " #type)
> =20
>  extern struct kernel_param_ops param_array_ops;
> diff --git a/init/main.c b/init/main.c
> --- a/init/main.c
> +++ b/init/main.c
> @@ -508,7 +508,7 @@ asmlinkage void __init start_kernel(void
>  =09parse_early_param();
>  =09parse_args("Booting kernel", static_command_line, __start___param,
>  =09=09   __stop___param - __start___param,
> -=09=09   0, 0, &unknown_bootoption);
> +=09=09   -1, -1, &unknown_bootoption);
> =20
>  =09jump_label_init();
> =20
>=20

It works for me too. But I think you can remove the 1st hunk, which seems t=
o be
a leftover from your tests.

Regards,
Beno=C3=AEt
