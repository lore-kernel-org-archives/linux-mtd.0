Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dC7S4-00034v-K3
 for linux-mtd@lists.infradead.org; Sat, 20 May 2017 16:42:02 +0000
Received: by mail-lf0-x241.google.com with SMTP id 99so2159538lfu.2
 for <linux-mtd@lists.infradead.org>; Sat, 20 May 2017 09:41:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170520182102.504f1372@bbrezillon>
References: <20170520152428.9184-1-mrugiero@gmail.com>
 <20170520152428.9184-2-mrugiero@gmail.com>
 <20170520182102.504f1372@bbrezillon>
From: Mario Rugiero <mrugiero@gmail.com>
Date: Sat, 20 May 2017 13:41:36 -0300
Message-ID: <CAKKQwLQz-biQ1exyYRu4sQ=mV6aJkp+F8uhQ_AqK=p7uiL9gNQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] mtd: create per-device and module-scope debugfs
 entries
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, cyrille.pitchen@wedev4u.fr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2017-05-20 13:21 GMT-03:00 Boris Brezillon <boris.brezillon@free-electrons.=
com>:
> Le Sat, 20 May 2017 12:24:26 -0300,
> "Mario J. Rugiero" <mrugiero@gmail.com> a =C3=A9crit :
>
> I'd like to have a bit more details explaining why you want to do that.
> Something like:
>
> "
> Several MTD drivers are currently creating their own debugfs directory
> at the root of the debugfs filesystem. Create an mtd directory and one
> subdirectory per MTD device so that specific MTD drivers or sub-layers
> (NAND, SPI-NOR, ...) can add their own debugfs files under a well known
> directory instead of spreading them over the debugfs tree.
> "
I'd probably use that text verbatim. Would that be right?
I hadn't realized some drivers did create their own entries at the
root, should a patch in this patch set update them to use the
per-device entry?
>
>> Signed-off-by: Mario J. Rugiero <mrugiero@gmail.com>
>
> You forgot to add my Ack here.
>
>> ---
>
> There should be a changelog here, or in the cover letter describing the
> evolution of this patch.
>
>>  drivers/mtd/mtdcore.c   | 17 +++++++++++++++++
>>  drivers/mtd/mtdcore.h   |  2 ++
>>  include/linux/mtd/mtd.h | 10 ++++++++++
>>  3 files changed, 29 insertions(+)
>>
>> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
>> index 1517da3ddd7d..461e8139ac2d 100644
>> --- a/drivers/mtd/mtdcore.c
>> +++ b/drivers/mtd/mtdcore.c
>> @@ -40,6 +40,7 @@
>>  #include <linux/slab.h>
>>  #include <linux/reboot.h>
>>  #include <linux/leds.h>
>> +#include <linux/debugfs.h>
>>
>>  #include <linux/mtd/mtd.h>
>>  #include <linux/mtd/partitions.h>
>> @@ -662,6 +663,8 @@ static void mtd_set_dev_defaults(struct mtd_info *mt=
d)
>>       }
>>  }
>>
>> +static struct dentry *dfs_dir_mtd;
>> +
>>  /**
>>   * mtd_device_parse_register - parse partitions and register an MTD dev=
ice.
>>   *
>> @@ -701,6 +704,10 @@ int mtd_device_parse_register(struct mtd_info *mtd,=
 const char * const *types,
>>
>>       mtd_set_dev_defaults(mtd);
>>
>> +     mtd->dbg.dfs_dir =3D debugfs_create_dir(mtd->name, dfs_dir_mtd);
>> +     if (IS_ERR(mtd->dbg.dfs_dir))
>> +             mtd->dbg.dfs_dir =3D NULL;
>> +
>>       memset(&parsed, 0, sizeof(parsed));
>>
>>       ret =3D parse_mtd_partitions(mtd, types, &parsed, parser_data);
>> @@ -740,6 +747,8 @@ int mtd_device_parse_register(struct mtd_info *mtd, =
const char * const *types,
>>  out:
>>       /* Cleanup any parsed partitions */
>>       mtd_part_parser_cleanup(&parsed);
>> +     if (ret)
>> +             debugfs_remove_recursive(mtd->dbg.dfs_dir);
>>       return ret;
>>  }
>>  EXPORT_SYMBOL_GPL(mtd_device_parse_register);
>> @@ -754,6 +763,8 @@ int mtd_device_unregister(struct mtd_info *master)
>>  {
>>       int err;
>>
>> +     debugfs_remove_recursive(master->dbg.dfs_dir);
>> +
>>       if (master->_reboot)
>>               unregister_reboot_notifier(&master->reboot_notifier);
>>
>> @@ -1807,6 +1818,10 @@ static int __init init_mtd(void)
>>
>>       proc_mtd =3D proc_create("mtd", 0, NULL, &mtd_proc_ops);
>>
>> +     dfs_dir_mtd =3D debugfs_create_dir("mtd", NULL);
>> +     if (IS_ERR(dfs_dir_mtd))
>> +             dfs_dir_mtd =3D NULL;
>> +
>>       ret =3D init_mtdchar();
>>       if (ret)
>>               goto out_procfs;
>> @@ -1816,6 +1831,7 @@ static int __init init_mtd(void)
>>  out_procfs:
>>       if (proc_mtd)
>>               remove_proc_entry("mtd", NULL);
>> +     debugfs_remove(dfs_dir_mtd);
>>       bdi_put(mtd_bdi);
>>  err_bdi:
>>       class_unregister(&mtd_class);
>> @@ -1826,6 +1842,7 @@ static int __init init_mtd(void)
>>
>>  static void __exit cleanup_mtd(void)
>>  {
>> +     debugfs_remove_recursive(dfs_dir_mtd);
>>       cleanup_mtdchar();
>>       if (proc_mtd)
>>               remove_proc_entry("mtd", NULL);
>> diff --git a/drivers/mtd/mtdcore.h b/drivers/mtd/mtdcore.h
>> index 55fdb8e1fd2a..b5d095d24087 100644
>> --- a/drivers/mtd/mtdcore.h
>> +++ b/drivers/mtd/mtdcore.h
>> @@ -19,6 +19,8 @@ int parse_mtd_partitions(struct mtd_info *master, cons=
t char * const *types,
>>
>>  void mtd_part_parser_cleanup(struct mtd_partitions *parts);
>>
>> +extern struct dentry *debug_mtd;
>> +
>>  int __init init_mtdchar(void);
>>  void __exit cleanup_mtdchar(void);
>>
>> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
>> index f8a2ef239c60..6cd0f6b7658b 100644
>> --- a/include/linux/mtd/mtd.h
>> +++ b/include/linux/mtd/mtd.h
>> @@ -206,6 +206,15 @@ struct mtd_pairing_scheme {
>>
>>  struct module;       /* only needed for owner field in mtd_info */
>>
>> +/**
>> + * struct mtd_debug_info - debugging information for an MTD device.
>> + *
>> + * @dfs_dir: direntry object of the MTD device debugfs directory
>> + */
>> +struct mtd_debug_info {
>> +     struct dentry *dfs_dir;
>> +};
>> +
>>  struct mtd_info {
>>       u_char type;
>>       uint32_t flags;
>> @@ -346,6 +355,7 @@ struct mtd_info {
>>       struct module *owner;
>>       struct device dev;
>>       int usecount;
>> +     struct mtd_debug_info dbg;
>>  };
>>
>>  int mtd_ooblayout_ecc(struct mtd_info *mtd, int section,
>
